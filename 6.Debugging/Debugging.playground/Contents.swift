import UIKit
import Combine

func applyPrint() {
    let publisher = (0...13).publisher
    publisher
        .print("debugging ->") //prints detailed info about the publisher on the fly. Info like subscription, request number, received values and finish;
        .sink { let _ = $0 }
}

applyPrint()
