import NavUI
import SwiftUI

final class PopCoordinator {
  let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    return navigation.start(root: RootView(coordinator: self))
  }
}
