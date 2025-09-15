//
//  HomeView.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    
    
    var body: some View {
        VStack{
            Spacer()
            
            ZStack {
                ForEach(Array(viewModel.restaurant.dropFirst(viewModel.currentIndex))) { restaurant in
                    let index = viewModel.restaurant.firstIndex(where: { $0.id == restaurant.id }) ?? 0
                    RestaurantCard(restaurant: restaurant)
                        .offset(y: CGFloat(index - viewModel.currentIndex) * 10) // vertical stack effect
                        .offset(x: index == viewModel.currentIndex ? viewModel.offsetX : 0) // horizontal animation for top card
                        .animation(.easeInOut(duration: 0.3), value: viewModel.currentIndex)
                        .zIndex(Double(viewModel.restaurant.count - index)) // ensures top card is above
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            HStack{
                ActionButton(action: {
                    if viewModel.currentIndex > 0 {
                        viewModel.offsetX = -UIScreen.main.bounds.width
                        viewModel.currentIndex -= 1
                        withAnimation(.easeInOut(duration: 0.3)) {
                            viewModel.offsetX = 0
                        }
                    }
                }, buttonDescription: "Previous", disabled: viewModel.currentIndex == 0)
                
                Spacer()
                
                ActionButton(action: {
                    if viewModel.currentIndex < viewModel.restaurant.count - 1 {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            viewModel.offsetX = -UIScreen.main.bounds.width
                          
                        }
                        viewModel.currentIndex += 1
                    }
                }, buttonDescription: "Next", disabled: viewModel.currentIndex == viewModel.restaurant.count - 1)
            }
            .padding(.horizontal,30)
        }
        .padding()
        .onAppear {
      
                viewModel.getUserLocation()
           
        }
        .task {
            viewModel.getRestaurantData()
        }
    }
}

#Preview {
    HomeView()
}
