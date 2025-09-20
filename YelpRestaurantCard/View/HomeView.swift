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
                
                if viewModel.currentIndex >= viewModel.restaurant.count{
                    
                    Text("Nothing to show")
                    
                }
                else{
                    ForEach(viewModel.restaurant.indices, id: \.self){
                        index in
                        let restaurant = viewModel.restaurant[index]
                        
                        RestaurantCard(restaurant: restaurant)
                        
                            .scaleEffect(max(0, 1.0 - (CGFloat(index - viewModel.currentIndex) * 0.10)))
                            .offset(y: CGFloat(index - viewModel.currentIndex) * 20)
                            .offset(x: index < viewModel.currentIndex ? -500 : 0)
                            .zIndex(-Double(index))
                    }
                    
                    
                }
            }
            Spacer()
            HStack{
                ActionButton(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        viewModel.currentIndex -= 1
                    }
                }, buttonDescription: "Back", disabled: viewModel.currentIndex > 0 ? false : true)
                Spacer()
                ActionButton(action: {
                    withAnimation(.easeInOut(duration: 0.5)){
                        viewModel.currentIndex += 1
                    }
                    
                }, buttonDescription: "Next", disabled: viewModel.currentIndex > viewModel.restaurant.count ? true : false)
            }
            .padding(.horizontal)
            
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
