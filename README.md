# YelpRestaurantCard

A simple SwiftUI app to show nearby restaurants using the Yelp API. Built for learning and demonstration.

---

## Features

- **Load images with SDWebImageSwiftUI**: Download and show restaurant images smoothly with caching.  
- **Secure API key**: The API key is in a configuration file and not included in the project for security.  
- **User location**: CoreLocation is used to get the current location to show nearby restaurants.  
- **Reusable components**: `RestaurantCard` and `ActionButton` make the code clean and avoid repetition.  
- **Card stack UI**: Simple and smooth UI to show restaurant info (name, image, rating, distance) with next/previous navigation.

---

## How It Works

1. Requests location permission from the user.
2. Upon authorization, fetches the user's current coordinates.
3. Calls the Yelp API to retrieve nearby restaurants.
4. Displays the restaurant information in a card stack UI with navigation buttons.

## Requirements

- Xcode 14.0 or later
- iOS 16.0 or later
- Swift 5.7 or later

## Tech Used

- SwiftUI  
- CoreLocation  
- SDWebImageSwiftUI  
- Swift Concurrency (`async/await`)  
- Yelp API  

