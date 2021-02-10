//
//  Timer.swift
//  UnderstandingObservableObjectsApp
//
//  Created by lapedro.veloso on 10/02/21.
//

import Foundation
import SwiftUI
import Combine

class TimeCounter: ObservableObject {
    
    @Published var value: Int = 0
    
    func start() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.value += 1
        }
    }
    
}
