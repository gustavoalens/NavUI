import NavUI
import SwiftUI

final class PopToRootCoordinator {
  let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    let root = navigation.start(root: PopToRootRootView(coordinator: self))
    navigation.push(view: PopToRootFirstView())
    navigation.push(view: PopToRootSecondView(coordinator: self))
    return root
  }
  
  func goToRoot() {
    navigation.popToRootView()
  }
}
