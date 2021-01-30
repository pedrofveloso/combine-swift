import UIKit
import Combine

func applyMinAndMax() {
    let publisher = [1, 2, 0, -23, 234].publisher
    
    publisher
        .min()
        .sink {
            print("Min:", $0)
        }
    
    publisher
        .max()
        .sink {
            print("Max:", $0)
        }
}

applyMinAndMax()
