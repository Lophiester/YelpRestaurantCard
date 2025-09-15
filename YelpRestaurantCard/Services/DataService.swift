//
//  DataService.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/15.
//

import Foundation

struct DataService{
    
    private let apiKey: String?
    
    init(){
        self.apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    }
    
    
    func fetchRestaurants() async throws -> [Business]{
        
        guard let apiKey else {throw URLError(.userAuthenticationRequired)}
        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=37.785834&longitude=-122.406417&term=restaurants&limit=10"
        
        guard let url = URL(string: urlString) else {throw URLError(.badURL)}
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let res = response as? HTTPURLResponse, res.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(SearchBusiness.self, from: data)
            
            return result.businesses
        }
        catch{
            throw error
        }
    }
}
