//
//  UnderstandingEnvironmentObjectsAppApp.swift
//  UnderstandingEnvironmentObjectsApp
//
//  Created by lapedro.veloso on 11/02/21.
//

import SwiftUI

@main
struct UnderstandingEnvironmentObjectsAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TimeCounter())
            // This function creates an environment object.
            // This object can be used by the content view and its children globally, without the requirement of inject the object N times to each children;
        }
    }
}
