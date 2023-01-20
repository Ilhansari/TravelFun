//
//  RestaurantDetails.swift
//  TravelFun
//
//  Created by Ilhan Sari on 20/01/2023.
//

import Foundation

struct RestaurantDetails: Codable {
    let description: String
    let popularDishes: [Dish]
}

struct Dish: Codable, Hashable {
    let name, price, photo: String
    let numPhotos: Int
}
