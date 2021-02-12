//
//  PositionDetailView.swift
//  GitHubJobsListApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import SwiftUI

struct PositionDetailView: View {
    
    var position: PositionViewModel
    
    var body: some View {
        Webview(content: position.description)
            .padding(.horizontal, 16)
            .navigationBarTitle(position.title,
                                displayMode: .inline)
    }
}
