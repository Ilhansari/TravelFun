//
//  RestaurantDetails.swift
//  TravelFun
//
//  Created by Ilhan Sari on 20/01/2023.
//

import Foundation

struct RestaurantDetails: Decodable {
  let description: String
  let popularDishes: [Dish]
  let photos: [String]
  let reviews: [Review]
}

struct Dish: Decodable, Hashable {
  let name, price, photo: String
  let numPhotos: Int
}

struct Review: Decodable, Hashable {
  let user: ReviewUser
  let rating: Int
  let text: String
}

struct ReviewUser: Decodable, Hashable {
  let id: Int
  let username, firstName, lastName, profileImage: String
}
