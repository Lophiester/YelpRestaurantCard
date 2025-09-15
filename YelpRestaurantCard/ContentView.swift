//
//  ContentView.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/15.
//

import SwiftUI

struct ContentView: View {
    
    var callApi =  DataService()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task{
                do{
                   try await callApi.fetchRestaurants()
                }
                catch{
                    print(error.localizedDescription)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
