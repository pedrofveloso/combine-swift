//
//  ContentView.swift
//  SwiftUIBasicApp
//
//  Created by lapedro.veloso on 09/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("placeholder")
                .resizable() 
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
            Text("Company & Co.")
                .font(.largeTitle)
                .foregroundColor(.purple)
            
            Text("Wilson Bennett")
                .font(.title)
                .foregroundColor(.red)
            
            HStack(spacing: 24) {
                Text("Senior Consultant")
                Text("Data Engineering")
            }.padding(.all)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
