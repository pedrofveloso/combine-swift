//
//  TimeCounter.swift
//  UnderstandingEnvironmentObjectsApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import Foundation

class TimeCounter: ObservableObject {
    @Published var value: Int = 0
    
    func start() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.value += 1
        }
    }
}
