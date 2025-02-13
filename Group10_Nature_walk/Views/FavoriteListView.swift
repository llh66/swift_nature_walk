//
//  FavoriteListView.swift
//  Group10_Nature_walk
//
//  Created by LLH on 2025-02-12.
//

import SwiftUI

struct FavoriteListView: View {
    
    @EnvironmentObject var favoriteListViewModel: FavoriteListViewModel
    @EnvironmentObject var sessionManager: SessionManager
    
    @State private var currentUserFavoriteList: [Session] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                if self.currentUserFavoriteList.isEmpty {
                    Text("No sessions in favorites")
                        .font(.title)
                        .bold()
                }
                else {
                    List {
                        ForEach(self.currentUserFavoriteList, id:\.id) { session in
                            SessionListItem(session: session)
                                .environmentObject(sessionManager)
                                .environmentObject(favoriteListViewModel)
                        }
                        .onDelete { offsets in
                            self.currentUserFavoriteList.remove(atOffsets: offsets)
                            self.favoriteListViewModel.favoriteLists[self.sessionManager.currentUser!.email] = currentUserFavoriteList
                            self.favoriteListViewModel.save()
                        }
                    }
                }
            }
            .onAppear {
                if let currentUserEmail = self.sessionManager.currentUser?.email {
                    self.currentUserFavoriteList = self.favoriteListViewModel.favoriteLists[currentUserEmail] ?? []
                }
            }
            
            
            .navigationTitle("Favorites")
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
                        
                        Button {
                            currentUserFavoriteList.removeAll()
                            self.favoriteListViewModel.favoriteLists[self.sessionManager.currentUser!.email] = currentUserFavoriteList
                            favoriteListViewModel.save()
                        } label: {
                            Label("Remove all", systemImage: "xmark.bin")
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
}

#Preview {
    FavoriteListView()
}
