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
    
    @Published var positions = [PositionViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPositions() {
        GitHubService().fetchPositions().map { positions in
            positions.map { PositionViewModel(position: $0) } }
            .sink(receiveCompletion: { _ in }) {
                self.positions = $0
            }
            .store(in: &cancellables)
    }
    
    func fetchImage(for position: Position) -> UIImage {
        
        guard let data = position.imageData, let image = UIImage(data: data) else {
            GitHubService().fetchImage(with: position.company_logo ?? "")
                .map { $0 }
                .sink(receiveCompletion: { _ in }, receiveValue: {
                    
                    if let index = self.positions.firstIndex(where: { position.id == $0.id }) {
                        self.positions[index].position.imageData = $0
                    }
                    
                })
                .store(in: &cancellables)
            
            return UIImage(named: "placeholder")!
        }
        
        return image
    }
}


struct PositionViewModel {
    var position: Position

    var id: String {
        return position.id
    }

    var title: String {
        return position.title
    }

    var company: String {
        return position.company
    }

    var locationAndType: String {
        return "\(position.location) - \(position.type)"
    }

    var description: String {
        return position.description
    }

}
