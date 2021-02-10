//
//  CreditCard.swift
//  UsingStateToFilterListApp
//
//  Created by lapedro.veloso on 09/02/21.
//

import Foundation
import SwiftUI

struct CreditCard: Identifiable {
    let id = UUID()
    let number: String
    let isExpired: Bool
    let imageName: String
}


extension CreditCard { // for tests purposes
    static var all: [CreditCard] {
        return [
            CreditCard(number: "1870 9812 7920 0823", isExpired: false, imageName: "master"),
            CreditCard(number: "8201 8273 0733 1192", isExpired: true, imageName: "visa"),
            CreditCard(number: "8273 1231 0192 6552", isExpired: true, imageName: "master"),
            CreditCard(number: "9870 7631 7012 1192", isExpired: false, imageName: "visa"),
            CreditCard(number: "1267 0012 7622 5182", isExpired: false, imageName: "diners"),
        ]
    }
}
