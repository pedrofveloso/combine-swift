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
        Webview(content: position.description)
            .padding(.horizontal, 16)
            .navigationBarTitle(position.title,
                                displayMode: .inline)
    }
}

struct PositionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PositionDetailView(position: Position(id: "",
                                              title: "Title",
                                              company: "Company",
                                              location: "Location",
                                              type: "Type",
                                              description: "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header><h1> Description </h1>"))
    }
}
