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
    
    runLoop.schedule(after: runLoop.now.advanced(by: .seconds(5))) {
        cancellable?.cancel()
        print("Event canceled.")
    }
}

useRunLoops()
