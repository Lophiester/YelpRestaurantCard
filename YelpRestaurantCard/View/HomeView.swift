//
//  HomeView.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import SwiftUI

struct HomeView: View {
    @State private var colors: [Color] = [.red, .green, .blue, .yellow, .orange]
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack{
            Spacer()
            
            ZStack{
                ForEach(Array(colors.enumerated()), id: \.element) { index, color in
                    if index >= currentIndex {
                        Rectangle()
                            .fill(color)
                            .frame(width: 300, height: 200)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                            .offset(y: CGFloat(index - currentIndex) * 10)
                    }
                }
            }
            
            Spacer()
            
            HStack{
                ActionButton(action: {
                    withAnimation {
                        if currentIndex > 0 {
                            currentIndex -= 1
                        }
                    }
                }, buttonDescription: "Previous", disabled: currentIndex == 0)
                
                Spacer()
                
                ActionButton(action: {
                    withAnimation {
                        if currentIndex < colors.count - 1 {
                            currentIndex += 1
                        }
                    }
                }, buttonDescription: "Next", disabled: currentIndex == colors.count - 1)
            }
            .padding(.horizontal,30)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
