//
//  ActionButton.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import SwiftUI

struct ActionButton: View {
    var action: () -> Void
    var buttonDescription: String
    var disabled: Bool
    
    var body: some View {
        Button(buttonDescription) {
            action()
        }

        .buttonStyle(.borderedProminent)
        .disabled(disabled)
    }
}

#Preview {
    ActionButton(action: {print(("tapped"))}, buttonDescription: "Next", disabled: false)
}
