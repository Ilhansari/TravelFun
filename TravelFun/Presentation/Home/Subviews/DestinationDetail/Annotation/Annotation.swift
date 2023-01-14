import Foundation

struct Attraction: Identifiable {
  let id = UUID().uuidString

  let name: String
  let latitude, longitude: Double
}
