//
//  ContentView.swift
//  UnderstandingObservableObjectsApp
//
//  Created by lapedro.veloso on 10/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    private var timeCounter = TimeCounter()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("\(timeCounter.value)")
                .font(.largeTitle)
            
            Button("Start timer") {
                timeCounter.start()
            }
            
            Button("Restart timer") {
                timeCounter.value = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
