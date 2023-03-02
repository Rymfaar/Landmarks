//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by ippon on 29/09/2022.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        .commands {
            LandmarkCommands()
        }

        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
