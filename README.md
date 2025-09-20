# YelpRestaurantCard

A simple SwiftUI app to show nearby restaurants using the Yelp API. Built for learning and demonstration.

---
## Setup

⚠️ **Important:** This project does not include the Yelp API key for security reasons.  
To run the app locally, follow these steps to add your API key:

1. In Xcode, go to **File → New → File...**  
2. In the template search, type **Configuration Settings File** and select it.  
3. Save the new file as `Config.xcconfig` in your project.  
4. Open `Config.xcconfig` and add the following line:

   KEY_API = >>>YOUR_API_KEY<<<

⚠️ Make sure to keep `KEY_API =` exactly like this, as this is the **build configuration variable name** that the project uses to access your API key. 

After this, the app will be able to access the Yelp API using your key.

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
- iOS 26 or later


## Tech Used

- SwiftUI  
- CoreLocation  
- SDWebImageSwiftUI  
- Swift Concurrency (`async/await`)  
- Yelp API  

