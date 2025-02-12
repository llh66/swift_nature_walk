//
//  SessionManager.swift
//  Group10_Nature_walk
//
//  Created by David Dang on 2025-02-12.
//

import SwiftUI

// The SessionManager class manages user login status, saving login credentials, and user preferences
class SessionManager: ObservableObject {
    
    // Published property to store the current user, automatically updates views when changed
    @Published var currentUser: User?
    
    // Published property to track whether the "Remember Me" option is enabled
    @Published var rememberMe: Bool = UserDefaults.standard.bool(forKey: "rememberMe")

    // Login function, which handles the authentication process and saving user preferences
    func login(user: User, rememberMe: Bool) {
        self.currentUser = user  // Set the current user as the logged-in user
        self.rememberMe = rememberMe  // Save the "Remember Me" setting
        
        // Save the "Remember Me" preference to UserDefaults
        UserDefaults.standard.set(rememberMe, forKey: "rememberMe")
        
        // If the user selects "Remember Me", save the email and password to UserDefaults
        if rememberMe {
            UserDefaults.standard.set(user.email, forKey: "savedEmail")
            UserDefaults.standard.set(user.password, forKey: "savedPassword")
        } else {
            // If "Remember Me" is not selected, remove the saved credentials from UserDefaults
            UserDefaults.standard.removeObject(forKey: "savedEmail")
            UserDefaults.standard.removeObject(forKey: "savedPassword")
        }
    }

    // Logout function, which handles user logout and clears saved credentials if necessary
    func logout() {
        currentUser = nil  // Set the current user to nil (user is logged out)
        
        // If "Remember Me" is disabled, remove saved credentials from UserDefaults
        if !rememberMe {
            UserDefaults.standard.removeObject(forKey: "savedEmail")
            UserDefaults.standard.removeObject(forKey: "savedPassword")
        }
    }
}
