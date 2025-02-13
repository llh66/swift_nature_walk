//
//  Session.swift
//  Group10_Nature_walk
//
//  Created by David Dang on 2025-02-06.
//

import Foundation
//The nature walk session class
//Also conforms to Identifiable to be used in lists
class Session: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let starRating: Int
    let host: String
    let contact: String
    let photos: [String]
    let pricePerPerson: Double
    
    init(name: String, description: String, starRating: Int, host: String, contact: String, photos: [String], pricePerPerson: Double) {
        self.name = name
        self.description = description
        self.starRating = starRating
        self.host = host
        self.contact = contact
        self.photos = photos
        self.pricePerPerson = pricePerPerson
    }
    
    static var defaultSessions: [Session] {
        [
            Session(name: "Sunnybrook Park", description: "Sunnybrook Park is a large public park in Toronto, Ontario, Canada. It is located north of Leaside and south of the Bridle Path areas of the city. The park is home to many bike trails, dog parks, and Sunnybrook Stables.", starRating: 5, host: "Denise Eaton", contact: "8654298137", photos:[ "https://images.unsplash.com/photo-1587991993507-ff688501c2b6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://upload.wikimedia.org/wikipedia/commons/f/f7/Sunnybrook_Park_2023.jpg", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flickr.com%2Fphotos%2Ffrankisme%2F26922515844&psig=AOvVaw1OpxLH6hHK8wCc6FV4X58r&ust=1739494702234000&source=images&cd=vfe&opi=89978449&ved=2ahUKEwjluOXvuL-LAxXNtIkEHStcJYUQjRx6BAgAEBk"], pricePerPerson: 10.0),
            //        Session(name: "Green Meadows Park", description: "", starRating: 4, host: "Leighton Ayers", contact: "8654298137", photos:[ "https://images.unsplash.com/photo-1716974793149-ac1fff09b17b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8R3JlZW4lMjBNZWFkb3dzJTIwUGFya3xlbnwwfHwwfHx8MA%3D%3D"], pricePerPerson: 12.0),
            Session(name: "Evergreen Brick Works", description: "A stunning urban oasis that brings together nature, sustainability, and community. Discover beautiful gardens, captivating sculptures, and fascinating exhibits.", starRating: 4, host: "Evergreen", contact: "2715157334", photos:[ "https://images.unsplash.com/photo-1698450149380-f94e763feb7c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/EvergreenBrickWorksEntrance.jpg/1599px-EvergreenBrickWorksEntrance.jpg?20200922010846"], pricePerPerson: 15.0),
            Session(name: "High Park", description: "High Park is Toronto's largest public park featuring many hiking trails, sports facilities, diverse vegetation, a beautiful lakefront, convenient parking, easy public transit access, a dog park, a zoo, playgrounds for children, a couple of eateries, greenhouses, picnic areas, a bunch of squirrels and various events throughout the year.", starRating: 5, host: "Simone Chandler", contact: "3817374384", photos:[ "https://images.unsplash.com/photo-1637273892573-ef523e98a591?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://upload.wikimedia.org/wikipedia/commons/a/a1/Hillside_Gardens_%2824677009128%29.jpg", "https://upload.wikimedia.org/wikipedia/commons/b/bc/High_Park%2C_Toronto_DSC_0129_%2817207727609%29.jpg"], pricePerPerson: 18.0),
            Session(name: "Crothers Woods", description: "Sunnybrook Park is a large public park in Toronto, Ontario, Canada. It is located north of Leaside and south of the Bridle Path areas of the city. The park is home to many bike trails, dog parks, and Sunnybrook Stables.", starRating: 4, host: "Royal Mills", contact: "4702743182", photos:[ "https://images.unsplash.com/photo-1627312594969-03102d0a5705?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q3JvdGhlcnMlMjBXb29kc3xlbnwwfHwwfHx8MA%3D%3D", "https://live.staticflickr.com/2842/9967895145_d78ee1f788_b.jpg"], pricePerPerson: 25.0)
        ]
    }
}
