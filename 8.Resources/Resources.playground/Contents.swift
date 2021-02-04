import UIKit
import Combine

let url = URL(string: "https://my-json-server.typicode.com/typicode/demo/posts")! //avoid force unwraps.

var cancellables: Set<AnyCancellable> = []
//var subscription1: AnyCancellable?
//var subscription2: AnyCancellable?
//var subscription3: AnyCancellable?

let justIgnore: ((Any) -> Void) = { _ in }

func showTheProblem() {
    // This method will show a common problem that occurs when you try to use a single publisher with two subscribers
    // In this case the publisher is fetching some data from internet.
    // And sometimes you will want to use the same response for two or more subscriptions, without making two or more requests.
    let request = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print()
   
    request.sink(receiveCompletion: justIgnore, receiveValue: {
        print("Subscription 1:", $0)
    })
    .store(in: &cancellables)
    
    request.sink(receiveCompletion: justIgnore, receiveValue: {
        print("Subscription 2:", $0)
    })
    .store(in: &cancellables)
    
    //Note that the request was made twice. That's not good since we're getting the same response for both subscriptions.
    //The ideal scenario is the request being made once, with the response being 'shared' between all subscpritions.
}

func applyShare() {
    print("apply share")
    let request = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print().share() //when we call 'share()' function, combine treat this publisher as a class, and use this same 'reference' for all the subscriptions, so only one request is made.
    
    request.sink(receiveCompletion: justIgnore, receiveValue: {
        print("Subscription 1:", $0)
    })
    .store(in: &cancellables)
    
    request.sink(receiveCompletion: justIgnore, receiveValue: {
        print("Subscription 2:", $0)
    })
    .store(in: &cancellables)
    
    //Note that only one request was made, and both subscriptions received the values
    
    // BUT maybe you are thinking "Ok, but... If a certain subscription sink after a certain amount of time? It will get the same stream of data?
    // The answer is: No. As you can see below.
    
    // Lets force a subscription to sink after 3 seconds
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        request.sink(receiveCompletion: justIgnore, receiveValue: {
            print("Subscription 3:", $0) //Note that this print never happens. Why?
        })
        .store(in: &cancellables)
    }
    
    // Well, after the second subscription the publisher doesn't receive any additional subscriptions (immediately), so the publisher sends a completion event finishing the stream.
    // So... is there any way to deal with that? Yes. Using multicast as descripited below.
}

func applyMultiCast() {
    print("apply multicast")
    let subject = PassthroughSubject<Data, URLError>()
    let request = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print().multicast(subject: subject)
    
    request
        .sink(receiveCompletion: justIgnore,
                 receiveValue: {
                    print("Subscription 1:", $0)
                 })
        .store(in: &cancellables)
    
    request
        .sink(receiveCompletion: justIgnore,
              receiveValue: {
                print("Subscription 2:", $0)
              })
        .store(in: &cancellables)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        request
            .sink(receiveCompletion: justIgnore,
                  receiveValue: {
                    print("Delayed subscription 3:", $0)
                  })
            .store(in: &cancellables)
        
        request.connect().store(in: &cancellables) // Tells the publisher to start the stream of data.
    }
    
    //So, what happened? We basically freezed the publisher until we had all the subscriptions available to use.
    //After that, we (kind of) connected the subscriptions with the publisher, allowing him to start the streaming of data.
}


//showTheProblem()
//applyShare()
applyMultiCast()
