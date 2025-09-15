//
//  RestaurantCard.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct RestaurantCard: View {
    var restaurant: Business
    
    var body: some View {
        
        VStack(alignment: .leading){
            WebImage(url: URL(string: restaurant.imageUrl ?? "No Image")) {
                $0.resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
                    .frame(width: 250, height: 100)
                    .clipped()
                    .padding()
            } placeholder: {
                ProgressView()
                    .frame(height: 50)
                    .frame(width: 250, height: 100)
            }

            VStack( alignment: .leading, spacing: 5){
                Text(restaurant.name ?? "")
                    .font(.title2)
                    .bold()
                HStack{
                    let starCount = Int((restaurant.rating ?? 0).rounded())
                    ForEach(0..<starCount, id: \.self) {
                        _ in Image(systemName:"star.fill")
                            .foregroundStyle(.yellow)
                            .font(.caption)
                    }
                }
                Text(Texthelper.distanceAwayText(meters: restaurant.distance ?? 0))
                    .foregroundStyle(.gray)
                    .font(.caption2)
                    .padding(.top, 5)
            }
            .padding()
        }
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(radius: 5)
        
    }
}

#Preview {
    RestaurantCard(
        restaurant: Business(
            id: "1",
            name: "Cafe Ola",
            imageUrl: "nil",
            rating: 4.5,
            distance: 100,
            categories: []
        )
    )
}
