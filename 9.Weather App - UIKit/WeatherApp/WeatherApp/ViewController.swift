//
//  ViewController.swift
//  WeatherApp
//
//  Created by lapedro.veloso on 05/02/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel!
    
    private let service = WeatherService()
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = service.fetch(for: "Recife")
            .catch { _ in Just(Weather.init(temp: nil, humidity: nil)) }
            .map { weather in
                guard let temperature = weather.temp else {
                    return "Something went wrong! Please try again."
                }
                return "\(temperature) ℃"
            }
            .assign(to: \.text, on: self.temperatureLabel)
    }

}

