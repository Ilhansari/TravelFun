//
//  Destination.swift
//  TravelFun
//
//  Created by Ilhan Sari on 08/01/2023.
//

import Foundation

struct Destination: Hashable {
  let country, city, imageName: String
  let latitude, longitude: Double
}

struct DestinationDetails: Decodable {
  let photos: [String]
}
