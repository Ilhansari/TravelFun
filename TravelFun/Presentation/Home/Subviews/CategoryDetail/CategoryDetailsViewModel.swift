//
//  CategoryDetailsViewModel.swift
//  TravelFun
//
//  Created by Ilhan Sari on 10/01/2023.
//

import Foundation

final class CategoryDetailsViewModel: ObservableObject {

  @Published var isLoading: Bool = true
  @Published var categories = [CategoryDetail]()

  init() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.isLoading = false
      self.categories = [
        CategoryDetail(name: "Art", imageName: "art1"),
        CategoryDetail(name: "Sport", imageName: "art2"),
      ]
    }
  }
}
