import NavUI
import SwiftUI

final class PresentCoordinator {
  private let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    let root = navigation.start(root: PresentRootView())
    navigation.present(view: PresentView())
    return root
  }
}
