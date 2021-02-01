//: A UIKit based Playground for presenting user interface

import Combine
import UIKit
import PlaygroundSupport

struct Post: Codable {
    let id: Int
    let title: String
}

struct Worker {
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        guard let url = URL(string: "https://my-json-server.typicode.com/typicode/demo/posts") else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { result in
            result.data //or just $0.data
        }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


class TableViewController : UITableViewController {
    private let worker = Worker()
    private var cancellable: AnyCancellable?
    private var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        cancellable = worker.fetchPosts()
            .catch { _ in Just([Post]()) }
            .assign(to: \.posts, on: self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)

        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = TableViewController()

