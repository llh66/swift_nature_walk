//
//  FavoriteListViewModel.swift
//  Group10_Nature_walk
//
//  Created by LLH on 2025-02-12.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    
    @Published var favoriteLists: [String: [Session]] = [:]
    
    func load() {
        if let savedData = UserDefaults.standard.data(forKey: "favoriteLists"), let savedLists = try? JSONDecoder().decode([String: [Session]].self, from: savedData) {
            self.favoriteLists = savedLists
        }
    }
    
    func save() {
        if let encodedLists = try? JSONEncoder().encode(self.favoriteLists) {
            UserDefaults.standard.set(encodedLists, forKey: "favoriteLists")
        }
    }
    
}
