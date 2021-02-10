//
//  WeatherService.swift
//  WeatherApp
//
//  Created by lapedro.veloso on 05/02/21.
//

import Foundation
import Combine

class WeatherService {
    private var appID: String?
    
    func fetch(for city: String) -> AnyPublisher<Weather, Error> {
        guard let appID = appID else {
            fatalError("Add your key from openweathermap; If you don't have one, sign up for free at openweathermap.org")
        }
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&APPID=\(appID)") else {
            return PassthroughSubject<Weather, Error>().eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
