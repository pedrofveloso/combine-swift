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

func applyOutput() {
    let publisher = [1, 2, 3, 4, 5].publisher
    
    print("Output at")
    publisher
        .output(at: 3)
        .sink {
        print("Output at index 3 is:", $0)
    }
    
    publisher
        .output(at: 6)
        .sink {
            print("Output at index 6 is:", $0) //Unreachable code because the sequence has only 5 elements.
        }
    
    print("Output in")
    publisher
        .output(in: (0...2))
        .sink {
            print("Outputs from index 0 to 2 are:", $0)
        }
    
    print("Output in")
    publisher
        .output(in: (0...10))
        .sink {
            print("Outputs from index 0 to 4 are:", $0) //It will print all the elements because the range is greater than the sequence lenght
        }
}

//applyMinAndMax()
//applyFirstAndLast()
applyOutput()
