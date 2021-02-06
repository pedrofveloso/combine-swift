//
//  ViewController.swift
//  WeatherApp
//
//  Created by lapedro.veloso on 05/02/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel! {
        didSet {
            temperatureLabel.text = "-"
            temperatureLabel.numberOfLines = 0
            temperatureLabel.textAlignment = .center
        }
    }
    @IBOutlet weak var cityTextField: UITextField! {
        didSet {
            cityTextField.placeholder = "Type a city here!"
        }
    }
    
    private let service = WeatherService()
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPublishers()
    }
    
    func setupPublishers() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.cityTextField)
        
        cancellable = publisher
            .compactMap { notification -> String? in
                guard let textField = notification.object as? UITextField else { return nil }
                return textField.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            }
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap { city in
                return self.service
                    .fetch(for: city)
                    .catch { _ -> Empty<Weather, Never> in
                        self.temperatureLabel.text = "-"
                        return Empty()
                    }
                    .map { weather -> String in
                        print("map")
                        if let temp = weather.temp {
                            return "\(temp) ℃"
                        }
                        return "Something went wrong! Please try again later."
                    }
            }
            .assign(to: \.text, on: self.temperatureLabel)
    }

}

