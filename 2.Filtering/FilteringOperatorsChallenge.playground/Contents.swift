import UIKit
import Combine

let seq = (1...100).publisher

seq.dropFirst(50)
    .prefix(20)
    .filter { $0 % 2 == 0 }
    .sink {
    print($0)
}
