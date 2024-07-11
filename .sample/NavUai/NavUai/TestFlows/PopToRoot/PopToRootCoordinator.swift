import NavUI
import SwiftUI

final class PopToRootCoordinator {
  let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    return EmptyView()
//    return navigation.start(root: RootView(coordinator: self))
  }
}
