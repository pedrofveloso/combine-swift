//
//  ContentView.swift
//  UnderstandingBindingApp
//
//  Created by lapedro.veloso on 10/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var isSigned: Bool = false
    
    @State
    private var name: String = ""
    
    var body: some View {
        VStack {
            Text("Please sign your name below")
            
            Text(name)
                .font(Font.custom("Zapfino", size: 16))
                .foregroundColor( isSigned ? .red : .black )
                .padding()
            
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .disabled(isSigned)
                .padding()
            
            SignButton(isSigned: $isSigned)
                .disabled(name.isEmpty)
        }
        
    }
}

struct SignButton: View {
    
    @Binding //Is a way to inject a state from another component
    var isSigned: Bool
    
    var body: some View {
        Button(action: {
            isSigned.toggle()
        }, label: {
            Text(isSigned ? "Re-sign" : "Sign")
                .padding()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
