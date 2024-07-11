import NavUI
import SwiftUI

final class PopToTypeCoordinator {
  let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    return navigation.start(root: RootView(coordinator: self))
  }
}
