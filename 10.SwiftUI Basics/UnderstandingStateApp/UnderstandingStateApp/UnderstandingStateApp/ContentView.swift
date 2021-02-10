//
//  ContentView.swift
//  UnderstandingStateApp
//
//  Created by lapedro.veloso on 09/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var count: Int = 0
    
    private func addCount() {
        count += 1
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("You hit the button \(count) times.")
            Button(action: addCount, label: {
                Text("Hit me!")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
