//
//  ContentView.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/15.
//

import SwiftUI

struct ContentView: View {
    @State var businesses = [Business]()
    
    var callApi =  DataService()
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(businesses) { b in
                    Text(b.name ?? "Nil")
                }
            }
        }
        .onAppear {
            Task{
                do{
                    businesses = try await callApi.fetchRestaurants()
                    print(businesses)
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
