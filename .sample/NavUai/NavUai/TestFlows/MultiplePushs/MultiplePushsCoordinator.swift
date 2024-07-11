import NavUI
import SwiftUI

final class MultiplePushsCoordinator {
  let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    return navigation.start(root: MultiplePushsRootView(coordinator: self))
  }
  
  func doFirstPush() {
    navigation.push(view: MultiplePushsFirstView(coordinator: self))
  }
  
  func doSecondPush() {
    navigation.push(view: MultiplePushsSecondView(coordinator: self))
  }
  
  func doThirdPush() {
    navigation.push(view: MultiplePushsThirdView(coordinator: self))
  }
}
