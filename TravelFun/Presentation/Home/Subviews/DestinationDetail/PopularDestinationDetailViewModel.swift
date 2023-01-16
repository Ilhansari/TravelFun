import SwiftUI

class PopularDestinationDetailViewModel: ObservableObject {

  @Published var isLoading = false
  @Published var errorMessage = ""
  @Published var details: DestinationDetails?

  init(name: String) {

    guard let url = URL(
      string: "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
    ) else { return }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data else { return }

        do {
          self.details = try JSONDecoder().decode(DestinationDetails.self, from: data)
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
