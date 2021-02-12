//
//  Position.swift
//  GitHubJobsListApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import Foundation

struct Position: Decodable {
    let id, title, company, location, type, description: String
}
