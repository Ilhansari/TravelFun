//
//  CategoryDetailsViewModel.swift
//  TravelFun
//
//  Created by Ilhan Sari on 10/01/2023.
//

import Foundation

final class CategoryDetailsViewModel: ObservableObject {

  @Published var isLoading: Bool = true
  @Published var errorMessage: String = ""
  @Published var categories = [CategoryDetail]()

  init(name: String) {
    print("Call the network request which is \(name)")
    guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else  { return }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

        guard let data = data else { return }

        do {
          self.categories = try JSONDecoder().decode([CategoryDetail].self, from: data)
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
