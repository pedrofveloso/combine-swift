//
//  SecondTimeCounterView.swift
//  UnderstandingEnvironmentObjectsApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import SwiftUI

struct SecondTimeCounterView: View {
    
    @EnvironmentObject var timeCounter: TimeCounter
    
    var body: some View {
        HStack (spacing: 16) {
            Text("\(timeCounter.value)")
                .font(.largeTitle)
            
            Button("Add 5 seconds") {
                timeCounter.value += 5
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
        }
    }
}

struct SecondeTimeCounterView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTimeCounterView().environmentObject(TimeCounter())
        // I'm adding the environmentObject here in order to works on preview.
    }
}
