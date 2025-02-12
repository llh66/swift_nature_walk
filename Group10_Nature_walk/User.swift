//
//  User.swift
//  Group10_Nature_walk
//
//  Created by David Dang on 2025-02-12.
//

import Foundation

// User class to represent a user with an email and password
class User: Codable, Identifiable {
    let id = UUID()
    let email: String
    let password: String

    // Initializer to create a User object with an email and password
    init(email: String, password: String) {
        self.email = email   
        self.password = password
    }
}
