//
//  GitHubService.swift
//  GitHubJobsListApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import Foundation
import Combine

enum ApiError: Error {
    case urlError
}

final class GitHubService {
    
    func fetchPositions() -> AnyPublisher<[Position], Error> {
        guard let url = URL(string: "https://jobs.github.com/positions.json") else {
            return Fail(error: ApiError.urlError).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Position].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
