import SwiftUI

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {


  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    allControllers.count
  }

  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    0
  }

  lazy var allControllers: [UIViewController] = []

  init(imageURLStrings: [String]) {

    UIPageControl.appearance().pageIndicatorTintColor = .systemGray
    UIPageControl.appearance().currentPageIndicatorTintColor = .red

    super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)

    allControllers = imageURLStrings.map({ imageName in
      let hostingController = UIHostingController(rootView:
      AsyncImage(url: URL(string: imageName))
        .scaledToFill())
      hostingController.view.clipsToBounds = true
      return hostingController
    })

    setViewControllers([allControllers.first!],
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
