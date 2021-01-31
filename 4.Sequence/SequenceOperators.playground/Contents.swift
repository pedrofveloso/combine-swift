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

func applyCount() {
    let publisher = ["P", "E", "D", "R", "O"].publisher
    publisher
        .count()
        .sink {
            print("Number of elements in sequence:", $0)
        }
    
    let publisher1 = PassthroughSubject<Int, Never>()
    publisher1
        .count()
        .sink {
            print("Number of elements passed through:", $0) //In order to make this code reachable you must uncomment the line 96
        }
    
    publisher1.send(0)
    publisher1.send(1)
//    publisher1.send(completion: .finished) //Why you need to uncomment this line? The count method works only on publishers already finish its streams.
                                           //So you need to send a completion event to make count works.
}

func applyContains() {
    let publisher = [0, 1, 2, 3].publisher
    publisher
        .contains(3)
        .sink {
            print("Is it contains the number 3?", $0)
        }
    
    publisher
        .contains(9)
        .sink {
            print("Is it contains the number 9?", $0)
        }
    
    publisher
        .contains(where: { $0 % 2 == 0 })
        .sink {
            print("Is it contains an even number?", $0)
        }
}

//applyMinAndMax()
//applyFirstAndLast()
//applyOutput()
//applyCount()
applyContains()
