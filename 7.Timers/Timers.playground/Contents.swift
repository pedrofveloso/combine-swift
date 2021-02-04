import UIKit
import Combine

var cancellable: Cancellable?
var anyCancellable: AnyCancellable?

func useRunLoops() {
    let runLoop = RunLoop.main
    
    cancellable = runLoop.schedule(after: runLoop.now,
                     interval: .seconds(2),
                     tolerance: .milliseconds(100)) {
        print("Event fired.")
    } //remember that when the function you're calling returns a cancellable object, you must hold it in some variable or constant, in order to receive the events.
    
    runLoop.schedule(after: runLoop.now.advanced(by: .seconds(5))) { //you also can use '.init(Date(timeIntervalSinceNow: 5)' as a value for the after: parameter.
        cancellable?.cancel()
        print("Event canceled.")
    }
}

func useTimers() {
    let unit = TimeInterval(2)
    let subscription = Timer.publish(every: unit, on: .main, in: .common).autoconnect()
    
    anyCancellable = subscription
        .scan(0) { current, _ in
                current + unit}
        .sink {
        print($0)
    }
}

func useDispatchQueue() {
    let queue = DispatchQueue.main
    let publisher = PassthroughSubject<Int, Never>()
    var count = 0
    
    cancellable = queue.schedule(after: queue.now,
                   interval: .seconds(1.0)) {
        publisher.send(count)
        count += 1
    }
    
    anyCancellable = publisher.sink {
        print($0)
    }
}

//useRunLoops()
//useTimers()
useDispatchQueue()
