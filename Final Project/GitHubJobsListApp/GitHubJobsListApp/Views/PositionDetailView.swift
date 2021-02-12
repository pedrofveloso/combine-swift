//
//  PositionDetailView.swift
//  GitHubJobsListApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import SwiftUI

struct PositionDetailView: View {
    
    var position: Position
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading, spacing: 16) {
                Text(position.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            .navigationTitle(position.title)
        }
    }
}

struct PositionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PositionDetailView(position: Position(id: "",
                                              title: "Title",
                                              company: "Company",
                                              location: "Location",
                                              type: "Type",
                                              description: "Description"))
    }
}
