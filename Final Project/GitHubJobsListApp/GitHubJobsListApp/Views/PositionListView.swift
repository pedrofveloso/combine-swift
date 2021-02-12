//
//  PositionListView.swift
//  GitHubJobsListApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import SwiftUI

struct PositionListView: View {
    
    @ObservedObject var viewModel = PositionListViewModel()
    
    init() {
        let coloredNavAppearance = UINavigationBarAppearance()
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemIndigo

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance

    }
    
    var body: some View {
        NavigationView {
    
            List(viewModel.positions, id: \.id) { position in

                HStack {
                    VStack(alignment: .leading) {
                        Text(position.title)
                            .font(.title2)
                        
                        Text(position.company)
                            .font(.body)
                        
                        Text("\(position.type) - \(position.location)")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }

            }
            .navigationTitle("GitHub Jobs")
        }
        .onAppear {
            viewModel.fetchPositions()
        }
    }
}

struct PositionListView_Previews: PreviewProvider {
    static var previews: some View {
        PositionListView()
    }
}
