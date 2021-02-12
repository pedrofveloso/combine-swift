//
//  PositionListView.swift
//  GitHubJobsListApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import Foundation
import SwiftUI
import Combine

final class PositionListViewModel: ObservableObject {
    
    @Published var positions = [Position]()
    private var cancellable: AnyCancellable?
    
    func fetchPositions() {
        cancellable = GitHubService().fetchPositions()
            .map { $0 }
            .sink(receiveCompletion: { _ in }) {
                self.positions = $0
            }
    }
}
