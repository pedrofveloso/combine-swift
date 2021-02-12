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
        coloredNavAppearance.backgroundColor = .systemOrange

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance

    }
    
    var body: some View {
        NavigationView {
    
            List(viewModel.positions, id: \.id) { positionViewModel in

               NavigationLink(
                destination: PositionDetailView(position: positionViewModel)) {
                    HStack {
                        
                        Image(uiImage: viewModel.fetchImage(for: positionViewModel.position))
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                        
                        VStack(alignment: .leading) {
                            Text(positionViewModel.title)
                                .font(.title2)
                            
                            Text(positionViewModel.company)
                                .font(.body)
                            
                            Text(positionViewModel.locationAndType)
                                .font(.callout)
                                .foregroundColor(.secondary)
                        }
                    }
                }

            }
            .navigationTitle("GitHub Jobs")
        }
        .accentColor(.white)
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
