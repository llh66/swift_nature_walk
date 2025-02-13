//
//  SessionDetailsView.swift
//  Group10_Nature_walk
//
//  Created by LLH on 2025-02-12.
//

import SwiftUI

struct SessionDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var favoriteListViewModel: FavoriteListViewModel
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let session: Session
    let isFavoriteListAccessible: Bool
    
    @State private var currentImage = 0
    @State private var isFavorite: Bool = false
    
    @State private var currentUserFavoriteList: [Session] = []
    
    var body: some View {
        ScrollView{
            VStack {
                Text(session.name)
                    .font(.title)
                    .bold()
                
                TabView(selection: $currentImage) {
                    ForEach(0..<session.photos.count, id: \.self) { index in
                        AsyncImage(url: URL(string: session.photos[index])) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .tag(index)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 200)
                .cornerRadius(10)
                
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= session.starRating ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.vertical)
                
                Text(session.description)
                
                Text("Guide or hosting organization: \(session.host)")
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Pricing: \(String(format: "$%.2f", session.pricePerPerson)) per person")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            .onAppear() {
                self.favoriteListViewModel.load()
                if let currentUserEmail = self.sessionManager.currentUser?.email {
                    self.currentUserFavoriteList = self.favoriteListViewModel.favoriteLists[currentUserEmail] ?? []
                    if currentUserFavoriteList.contains(where: { $0.name == session.name }) {
                        self.isFavorite = true
                    }
                    else {
                        self.isFavorite = false
                    }
                }
                else {
                    dismiss()
                }
            }
            
            .navigationTitle("Session Details")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Menu {
                        // Add a logout button in the toolbar
                        Button {
                            sessionManager.logout()
                            dismiss()
                        } label: {
                            Label("Log out", systemImage: "rectangle.portrait.and.arrow.forward")
                        }
                        
                        if self.isFavoriteListAccessible {
                            NavigationLink(destination: FavoriteListView().environmentObject(sessionManager)
                                .environmentObject(favoriteListViewModel)) {
                                Label("Favorite List", systemImage: "heart")
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .navigationBarItems(trailing: Button {
                self.isFavorite.toggle()
                
                if self.isFavorite {
                    currentUserFavoriteList.append(session)
                }
                else {
                    if let index = currentUserFavoriteList.firstIndex(where: { $0.name == session.name }) {
                        currentUserFavoriteList.remove(at: index)
                    }
                }
                
                self.favoriteListViewModel.favoriteLists[self.sessionManager.currentUser!.email] = currentUserFavoriteList
                self.favoriteListViewModel.save()
            } label: {
                Image(systemName: self.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            })
        }
    }
}

#Preview {
    SessionDetailsView(session: Session(name: "Crothers Woods", description: "Sunnybrook Park is a large public park in Toronto, Ontario, Canada. It is located north of Leaside and south of the Bridle Path areas of the city. The park is home to many bike trails, dog parks, and Sunnybrook Stables.", starRating: 4, host: "Royal Mills", photos:[ "https://images.unsplash.com/photo-1627312594969-03102d0a5705?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q3JvdGhlcnMlMjBXb29kc3xlbnwwfHwwfHx8MA%3D%3D", "https://live.staticflickr.com/2842/9967895145_d78ee1f788_b.jpg"], pricePerPerson: 25.0), isFavoriteListAccessible: true)
}
