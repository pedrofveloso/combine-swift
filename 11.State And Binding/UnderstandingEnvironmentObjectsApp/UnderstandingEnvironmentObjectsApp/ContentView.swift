//
//  ContentView.swift
//  UnderstandingEnvironmentObjectsApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("The power of @EnvironmentObjects").padding()
            
            FirstTimeCounterView()
            
            SecondTimeCounterView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TimeCounter())
        // I'm adding the environmentObject here in order to works on preview.
    }
}
