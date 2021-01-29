import UIKit
import Combine

//Add items at the beginning of the sequence
func applyPrepend() {
    let publisher1 = (5...10).publisher
    let publisher2 = (0...4).publisher
    
    print("--- prepend a sequence ---")
    publisher1.prepend(3, 4).sink { print($0) }
    
    print("--- prepend a publisher ---")
    publisher1.prepend(publisher2)
        .sink {
            print($0)
        }
}

func applyAppend() {
    let publisher1 = (1...2).publisher
//    let publisher2 = "six seven".components(separatedBy: " ").publisher
    let publisher2 = [3,9].publisher
    
    print("--- prepend a sequence ---")
    publisher1.append(3, 4).sink { print($0) }
    
    print("--- prepend a publisher ---")
    publisher1.append(publisher2).sink { print($0) }
}

func applySwitchToLatest() {
    let publisher1 = PassthroughSubject<String, Never>()
    let publisher2 = PassthroughSubject<String, Never>()
    
    let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()
    
    publishers.switchToLatest().sink {
        print($0)
    }
    
    publishers.send(publisher1)
    
    publisher1.send("a")
    publisher1.send("b")
    
    publishers.send(publisher2)
    publisher2.send("1")
    publisher1.send("c")
    
}

//applyPrepend()
//applyAppend()
applySwitchToLatest()
