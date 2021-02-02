import UIKit
import Combine

var cancellable: AnyCancellable?

func applyPrint() {
    let publisher = (0...13).publisher
    publisher
        .print("debugging ->") //prints detailed info about the publisher on the fly. Info like subscription, request number, received values and finish;
        .sink { let _ = $0 }
}

func applyHandleEvents() {
    guard let url = URL(string: "https://my-json-server.typicode.com/typicode/demo/posts") else {
        fatalError("Invalid URL")
    }
    
    let request = URLSession.shared.dataTaskPublisher(for: url)
    
    cancellable = //Comment this line if you want to see the request being canceled, and how is it printed.
        request.handleEvents(receiveSubscription: { _ in print("received subscription") },
                                            receiveOutput: { _, _ in print("received output") },
                                            receiveCompletion: { _ in print("received completion") },
                                            receiveCancel: { print("received cancel") },
                                            receiveRequest: { _ in print("received request") })
        .sink(receiveCompletion: { print($0) }) { data, response in
            print(data)
        }
    
}

//applyPrint()
applyHandleEvents()
