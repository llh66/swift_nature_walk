//
//  SessionListItem.swift
//  Group10_Nature_walk
//
//  Created by LLH on 2025-02-12.
//

import SwiftUI

struct SessionListItem: View {
    
    let session: Session
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var favoriteListViewModel: FavoriteListViewModel
    
    var body: some View {
        HStack {
            // Load and display the session's photo asynchronously
            if let imageURL = URL(string: session.photos[0]) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        // If image is successfully loaded, display it
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Rectangle())
                    case .failure(_):
                        // If the image fails to load, show a default icon
                        Image(systemName: "rectangle.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                    default:
                        // If the image is loading, show a default icon
                        Image(systemName: "rectangle.dashed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            // Display session name and price per person
            VStack(alignment: .leading) {
                Text(session.name)
                    .font(.headline)
                Text("$\(session.pricePerPerson, specifier: "%.2f") per person")
                    .font(.subheadline)
            }
            
            Spacer()
            
            NavigationLink(destination: SessionDetailsView(session: session)
                .environmentObject(sessionManager)
                .environmentObject(favoriteListViewModel)) {
                //no label
            }
                .frame(width: 10)
        }
    }
}
