//
//  DataService.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import Foundation

struct SearchBusiness: Codable{
    
    var businesses = [Business]()
    var region = Region()
    var total = 0
    
}

struct Business: Codable, Identifiable {
    
    let id: String
    var name: String?
    var imageUrl: String?
    var rating: Double?
    var distance: Double?
    var categories: [Category]
    var coordinates: Coordinates?
    
}

struct Category: Codable {
    var alias: String
    var title: String
}


struct Region: Codable {
    var center: Coordinates?
}


struct Coordinates: Codable {
    var latitude: Double?
    var longitude: Double?
}
