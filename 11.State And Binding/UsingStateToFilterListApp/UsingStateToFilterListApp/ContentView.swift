//
//  ContentView.swift
//  UsingStateToFilterListApp
//
//  Created by lapedro.veloso on 09/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var isExpired: Bool = false
    
    private var cards: [CreditCard] = CreditCard.all
    
    var body: some View {
        List {
            Toggle(isOn: $isExpired, label: {
                Text("Expired")
                    .font(.title2)
            })
            .toggleStyle(SwitchToggleStyle(tint: .red))
            
            ForEach(cards.filter { card in
                card.isExpired == self.isExpired
            }) {
                makeCell(from: $0)
            }
        }
    }
    
    private func makeCell(from card: CreditCard) -> some View {
        HStack {
            Image(card.imageName)
                .resizable()
                .frame(width: 60, height: 52)
            
            Text(card.number)
                .font(.title2)
            
            Spacer()
            
            if (card.isExpired) {
                Image("expired")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
