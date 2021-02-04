import UIKit
import Combine

var cancellable: Cancellable?

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
    
    cancellable = subscription
        .scan(0) { current, _ in
                current + unit}
        .sink {
        print($0)
    }
}

//useRunLoops()
useTimers()
