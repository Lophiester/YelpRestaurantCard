//
//  HomeView.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentIndex: Int = 0
    @State private var restaurant = [Business]()
    @State private var offsetX: CGFloat = 0
    
    var service = DataService()
    
    var body: some View {
        VStack{
            Spacer()
            
            ZStack {
                ForEach(currentIndex..<min(currentIndex + 3, restaurant.count), id: \.self) { index in
                    RestaurantCard(restaurant: restaurant[index])
                        .offset(y: CGFloat(index - currentIndex) * 10)
                        .offset(x: index == currentIndex ? offsetX : 0)
                        .animation(.easeInOut(duration: 0.3), value: currentIndex)
                        .zIndex(Double(restaurant.count - index))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            HStack{
                ActionButton(action: {
                    if currentIndex > 0 {
                        offsetX = -UIScreen.main.bounds.width
                        currentIndex -= 1
                        withAnimation(.easeInOut(duration: 0.3)) {
                            offsetX = 0
                        }
                    }
                }, buttonDescription: "Previous", disabled: currentIndex == 0)
                
                Spacer()
                
                ActionButton(action: {
                    if currentIndex < restaurant.count - 1 {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            offsetX = -UIScreen.main.bounds.width
                          
                        }
                        currentIndex += 1
                    }
                }, buttonDescription: "Next", disabled: currentIndex == restaurant.count - 1)
            }
            .padding(.horizontal,30)
        }
        .padding()
        .task {
            do {
                restaurant = try await service.fetchRestaurants()
            } catch {
                print("Error fetching restaurants: \(error)")
            }
        }
    }
}

#Preview {
    HomeView()
}
