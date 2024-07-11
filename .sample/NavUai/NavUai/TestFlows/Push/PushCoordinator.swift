import NavUI
import SwiftUI

final class PushCoordinator {
  private let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    return navigation.start(root: PushRootView(coordinator: self))
  }
  
  func doPush() {
    navigation.push(view: PushFirstView())
  }
}
