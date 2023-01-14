import Foundation

struct Attraction: Identifiable {
  let id = UUID().uuidString

  let imageName: String
  let name: String
  let latitude, longitude: Double
}
