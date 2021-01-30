import UIKit
import Combine

let publisher = [1, 2, 0, -23, 234].publisher

func applyMinAndMax() {
    
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

func applyFirstAndLast() {
    let publisher = ["X", "P", "T", "O"].publisher
    publisher
        .first()
        .sink {
            print("First element:", $0)
        }
    
    publisher
        .first(where: { "TAP".contains($0) })
        .sink {
            print("First element contained in the word TAP:", $0)
        }
    
    publisher
        .last()
        .sink {
            print("Last element:", $0)
        }
    
    publisher
        .last(where: { "CLAP".contains($0) })
        .sink {
            print("Last element contained in the word CLAP:", $0)
        }
}

//applyMinAndMax()
applyFirstAndLast()
