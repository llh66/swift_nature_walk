//
//  Session.swift
//  Group10_Nature_walk
//
//  Created by David Dang on 2025-02-06.
//

import Foundation
//The nature walk session class
//Also conforms to Identifiable to be used in lists
class Session: Identifiable {
    let id = UUID()
    let name: String
    let pricePerPerson: Double
    let photo: String
// Initializer to set up a session with a name, price, and photo
    init(name: String, pricePerPerson: Double, photo: String) {
        self.name = name
        self.pricePerPerson = pricePerPerson
        self.photo = photo
    }
}
