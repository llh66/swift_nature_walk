//
//  ContentView.swift
//  Group10_Nature_walk
//
//  Created by LLH on 2025-02-08.
//

import SwiftUI

// The main content view for the app
struct ContentView: View {
    // Environment object to manage the session state
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        // Check if there is a current user session
        if sessionManager.currentUser == nil {
            // If no user is logged in, show the LoginView and pass the users data
            LoginView(users: users)
        } else {
            // If there is a logged-in user, show the SessionsListView
            SessionsListView()
        }
    }
}

// A predefined list of users with email and password for login purposes
let users = [
    User(email: "test@gmail.com", password: "test123"),
    User(email: "admin@gmail.com", password: "admin123")
]
