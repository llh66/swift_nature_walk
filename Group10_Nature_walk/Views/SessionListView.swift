//
//  SessionListView.swift
//  Group10_Nature_walk
//
//  Created by David Dang on 2025-02-06.
//

import SwiftUI

// View for displaying a list of available nature walk sessions
struct SessionsListView: View {
    
    // Environment object to access session management (e.g., for logging out)
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject var favoriteListViewModel = FavoriteListViewModel()

    // Predefined list of sessions with their name, price, and photo URL
    let sessions = Session.defaultSessions

    var body: some View {
        // The main navigation view for the list of sessions
        NavigationStack {
            // A list to display each session
            List(sessions) { session in
                SessionListItem(session: session, isFavoriteAccessible: true)
                    .environmentObject(sessionManager)
                    .environmentObject(favoriteListViewModel)
            }
            .navigationTitle("Nature Walk Sessions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        // Add a logout button in the toolbar
                        Button {
                            sessionManager.logout()
                        } label: {
                            Label("Log out", systemImage: "rectangle.portrait.and.arrow.forward")
                        }
                        
                        NavigationLink(destination: FavoriteListView()
                            .environmentObject(sessionManager)
                            .environmentObject(favoriteListViewModel)) {
                            Label("Favorite List", systemImage: "heart")
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
    }
}
