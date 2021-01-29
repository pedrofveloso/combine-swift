import UIKit
import Combine

func applyFilter() {
    let numbers = (1...20).publisher
    let oddNumbers = numbers.filter {
        $0 % 2 != 0
    }
    oddNumbers.sink {
        print($0)
    }
}

func applyRemoveDuplicates() {
    let words = "pedro pedro danilo ferreira veloso veloso".components(separatedBy: " ").publisher
    //send all single word of the sequence as an event
    print("--- Without removing the duplicates ---")
    words.sink {
        print($0)
    }
    print("--- Removing the duplicates ---")
    //send the events of the sequence ignoring the next event if it was equal to the last event sent.
    words.removeDuplicates().sink {
        print($0)
    }
}

func applyCompactMap() {
    let array = ["pedro", "2", "6.2123129123", "12", "veloso"].publisher
    array.compactMap { Int($0) }
        .sink {
            print($0)
        }
}

func applyIgnoreOutput() {
    let seq = (1...1000).publisher
    seq.ignoreOutput().sink {
        print($0)
    } receiveValue: {
        print($0)
    }
}

func applyFirst() {
    let seq = ["pedro", "danilo", "ferreira", "veloso"].publisher
    seq.first(where: { $0.hasPrefix("fe") } )
        .sink {
            print($0)
        }
}

func applyLast() {
    let seq = "pedro danilo ferreira veloso".components(separatedBy: " ").publisher
    seq.last(where: { $0.hasSuffix("o") })
        .sink {
            print($0)
        }
}

func applyDropFirst() {
    let seq = (1...10).publisher
    seq.dropFirst(3).sink {
        print($0)
    }
}

func applyDropWhile() {
    let seq = "pedro danilo ferreira veloso".components(separatedBy: " ").publisher
    seq.drop(while: { $0.hasSuffix("o") })
        .sink {
            print($0)
        }
}

func applyDropUntilOutputFrom() {
    let isLastName = PassthroughSubject<Void, Never>()
    let names = PassthroughSubject<String, Never>()
    
    names.drop(untilOutputFrom: isLastName)
        .sink {
            print($0)
        }
    
    ["pedro", "danilo", "ferreira", "veloso"].forEach { string in
        if string == "veloso" {
            isLastName.send()
        }
        names.send(string)
    }
}

func applyPrefix() {
    let seq = (1...10).publisher
    print("--- max length ---")
    seq.prefix(5)
        .sink {
            print($0)
        }
    
    print("--- while ---")
    seq.prefix(while: { $0 <= 3 })
        .sink {
            print($0)
        }
    
    print("--- until output from ---")
    let isEven = PassthroughSubject<Void, Never>()
    let numbers = PassthroughSubject<Int, Never>()
    
    numbers.prefix(untilOutputFrom: isEven)
        .sink {
            print($0)
        }
    (1...10).forEach { n in
        if n % 2 == 0 {
            isEven.send()
        }
        numbers.send(n)
    }
}

//applyFilter()
//applyRemoveDuplicates()
//applyCompactMap()
//applyIgnoreOutput()
//applyFirst()
//applyLast()
//applyDropFirst()
//applyDropWhile()
//applyDropUntilOutputFrom()
//applyPrefix()
