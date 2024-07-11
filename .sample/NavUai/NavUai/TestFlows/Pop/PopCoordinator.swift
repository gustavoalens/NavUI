import NavUI
import SwiftUI

final class PopCoordinator {
  let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    let root = navigation.start(root: PopRootView(coordinator: self))
    doFirstPush()
    doSecondPush()
    return root
  }
  
  func doFirstPush() {
    navigation.push(view: PopFirstView(coordinator: self))
  }
  
  func doSecondPush() {
    navigation.push(view: PopSecondView(coordinator: self))
  }
  
  func back() {
    navigation.popView()
  }
}
