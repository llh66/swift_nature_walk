//
//  Group10_Nature_walkApp.swift
//  Group10_Nature_walk
//
//  Created by LLH on 2025-02-08.
//

import SwiftUI

@main
struct Group10_Nature_walkApp: App {
    
    // State object to manage the session state throughout the app
    @StateObject private var sessionManager = SessionManager()

    var body: some Scene {
        WindowGroup {
            // Pass the sessionManager object as an environment object to the ContentView
            ContentView().environmentObject(sessionManager)
        }
    }
}
