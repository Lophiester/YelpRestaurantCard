//
//  RestaurantCard.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import SwiftUI

struct RestaurantCard: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Image("test")
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 10))
                .frame(width: 250, height: 100)
                .clipped()
                .padding()
                .overlay( Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .padding(10),
                          alignment: .topTrailing
                )
            VStack( alignment: .leading, spacing: 5){
                Text("Cafe ola")
                    .font(.title2)
                    .bold()
                HStack{
                    
                    ForEach(0..<5) {
                        index in Image(systemName:"star.fill")
                            .foregroundStyle(.yellow)
                            .font(.caption)
                    }
                }
                Text("100 meters away")
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
    RestaurantCard()
}
