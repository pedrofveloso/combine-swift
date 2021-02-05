//
//  Weather.swift
//  WeatherApp
//
//  Created by lapedro.veloso on 05/02/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?
}
