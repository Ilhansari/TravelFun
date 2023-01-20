import Foundation

class RestaurantDetailsViewModel: ObservableObject {

  @Published var isLoading: Bool = true
  @Published var errorMessage: String = ""
  @Published var restaurantDetails: RestaurantDetails?

  init(id: Int) {

    let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(id)")
    guard let url = url else { return }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

        guard let data = data else { return }

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
