//
//  FirstTimeCounterView.swift
//  UnderstandingEnvironmentObjectsApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import SwiftUI

struct FirstTimeCounterView: View {
    
    @EnvironmentObject var timeCounter: TimeCounter
    
    var body: some View {
        VStack {
            Text("\(timeCounter.value)")
                .font(.largeTitle)
            
            Button("Start counter") {
                timeCounter.start()
            }
            .foregroundColor(.orange)
            .padding()
        }
        .background(Color.secondary.opacity(0.4))
    }
}

struct FirstTimeCounterView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeCounterView().environmentObject(TimeCounter())
        // I'm adding the environmentObject here in order to works on preview.
    }
}
