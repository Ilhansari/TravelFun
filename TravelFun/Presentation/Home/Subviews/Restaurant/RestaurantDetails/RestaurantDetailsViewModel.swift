import Foundation

class RestaurantDetailsViewModel: ObservableObject {

  @Published var isLoading: Bool = true
  @Published var errorMessage: String = ""
  @Published var restaurantDetails: RestaurantDetails?

  init(id: Int) {

    guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(id)") else { return }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.async {

        guard let data = data else {
          self.errorMessage = error?.localizedDescription ?? ""
          return
        }

        do {
          self.restaurantDetails = try JSONDecoder().decode(RestaurantDetails.self, from: data)
        } catch {
          print("Failed to decode JSON:", error)
          self.errorMessage = error.localizedDescription
        }
        self.isLoading = false
      }
    }
    .resume()
  }
}
