//
//  Texthelper.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import Foundation

struct Texthelper {
    
    static func distanceAwayText(meters: Double) ->String{
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        } else{
            return "\(Int(round(meters))) m away"
        }
    }
    

}
