import UIKit
import Combine

func applyMin() {
    let publisher = [1, 2, 0, -23, 234].publisher
    
    publisher
        .min()
        .sink {
            print($0)
        }
}

func applyMax() {
    let publisher = [0, 19, 123, -32].publisher
    publisher
        .max()
        .sink {
            print($0)
        }
}

//applyMin()
applyMax()
