//
//  HeaderDestinationContainer.swift
//  TravelFun
//
//  Created by Ilhan Sari on 14/01/2023.
//

import SwiftUI
import UIKit

struct HeaderDestinationContainer: UIViewControllerRepresentable {
  
  func makeUIViewController(context: Context) -> UIViewController {
    let pageVC = CustomPageViewController()
    return pageVC
  }

  typealias UIViewControllerType = UIViewController

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

struct HeaderDestinationContainer_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDestinationContainer()
  }
}

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {


  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    allControllers.count
  }

  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    0
  }

  let firstVC = UIHostingController(rootView: Text("First VC"))
  let secondVC = UIHostingController(rootView: Text("Second VC"))
  let thirdVC = UIHostingController(rootView: Text("Third VC"))

  lazy var allControllers: [UIViewController] = [firstVC, secondVC, thirdVC]

  init() {

    UIPageControl.appearance().pageIndicatorTintColor = .systemGray
    UIPageControl.appearance().currentPageIndicatorTintColor = .red

    super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)

    setViewControllers([firstVC],
                       direction: .forward,
                       animated: true)

    self.dataSource = self
    self.delegate = self
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let index = allControllers.firstIndex(of: viewController) else {
      return nil
    }

    if index == 0  { return nil }

    return allControllers[index - 1]
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let index = allControllers.firstIndex(of: viewController) else {
      return nil
    }

    if index == allControllers.count - 1  { return nil }

    return allControllers[index + 1]
  }

}
