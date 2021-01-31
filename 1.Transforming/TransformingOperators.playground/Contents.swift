import Foundation
import Combine

func applyCollect() {
    [1, 2, 3, 4].publisher.collect(2).sink {
        print($0)
    }
}

func applyMap() {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    [532, 120, 100923].publisher.map {
        formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
    }.sink {
        print($0)
    }
}

func applyMapKeyPath() {
    struct PersonalData {
        let firstName, lastName: String
    }
    
    let publisher = PassthroughSubject<PersonalData, Never>()
    
    publisher.map(\.firstName, \.lastName).sink { firstName, lastName in
        print("The name is \(firstName) \(lastName)")
    }
    
    publisher.send(PersonalData(firstName: "Pedro", lastName: "Veloso"))
}

func applyFlatMap() {
    struct Person {
        let name: String
        let age: CurrentValueSubject<Int, Never>
        
        init(name: String, age: Int) {
            self.name = name
            self.age = CurrentValueSubject(age)
        }
    }
    
    let pedro = Person(name: "Pedro", age: 29)
    let bia = Person(name: "Bia", age: 26)
    
    let person = CurrentValueSubject<Person, Never>(pedro)
    
    person.flatMap{
        $0.age
    }.sink {
        print($0)
    }
    
    person.value = bia
    
    pedro.age.value += 1
    bia.age.value += 2
}

func applyReplaceNil() {
    [1, 2, nil, 3].publisher.replaceNil(with: 0).sink {
        print($0)
    }
}

func unwrapChallenge() {
    [1, 2, nil, 3].publisher.compactMap { $0 }.sink {
        print($0)
    }
}

func applyReplaceEmpty() {
    let empty = Empty<Int, Never>()
    
    //only send an event "finished"
    empty.sink {
        print("Just received the completion:", $0)
    } receiveValue: {
        print("Just received the value ->", $0)
    }
    
    //receive
    empty.replaceEmpty(with: 1)
        .sink {
            print("Just received the completion:", $0)
        } receiveValue: {
            print("Just received the value:", $0)
        }
}

func applyScan() {
    let publisher = (1...10).publisher
    
    publisher.scan([]) { numbers, value -> [Int] in
        numbers + [value]
    }.sink {
        print("Array is", $0)
    }
}

//applyCollect()
//applyMap()
//applyMapKeyPath()
//applyFlatMap()
//applyReplaceNil()
//unwrapChallenge()
//applyReplaceEmpty()
applyScan()
