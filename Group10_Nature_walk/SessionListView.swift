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

    // Predefined list of sessions with their name, price, and photo URL
    let sessions = [
        Session(name: "Sunnybrook Park", pricePerPerson: 10.0, photo: "https://images.unsplash.com/photo-1587991993507-ff688501c2b6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        Session(name: "Green Meadows Park", pricePerPerson: 12.0, photo: "https://images.unsplash.com/photo-1716974793149-ac1fff09b17b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8R3JlZW4lMjBNZWFkb3dzJTIwUGFya3xlbnwwfHwwfHx8MA%3D%3D"),
        Session(name: "Evergreen Brick Works", pricePerPerson: 15.0, photo: "https://images.unsplash.com/photo-1698450149380-f94e763feb7c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        Session(name: "High Park", pricePerPerson: 18.0, photo: "https://images.unsplash.com/photo-1637273892573-ef523e98a591?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        Session(name: "Crothers Woods", pricePerPerson: 25.0, photo: "https://images.unsplash.com/photo-1627312594969-03102d0a5705?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q3JvdGhlcnMlMjBXb29kc3xlbnwwfHwwfHx8MA%3D%3D")
    ]

    var body: some View {
        // The main navigation view for the list of sessions
        NavigationView {
            // A list to display each session
            List(sessions) { session in
                HStack {
                    // Load and display the session's photo asynchronously
                    if let imageURL = URL(string: session.photo) {
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
                }
            }
            .navigationTitle("Nature Walk Sessions")
            .toolbar {
                // Add a logout button in the toolbar
                Button {

                    sessionManager.currentUser = nil
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                        .foregroundColor(.red)
                }
            }
        }
    }
}
