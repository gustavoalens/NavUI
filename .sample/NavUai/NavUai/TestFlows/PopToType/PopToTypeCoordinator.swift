import NavUI
import SwiftUI

final class PopToTypeCoordinator {
  let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    let root = navigation.start(root: PopToTypeRootView(coordinator: self))
    startFlow()
    return AnyView(root)
  }
  
  func restart() {
    navigation.popToRootView()
    startFlow()
  }
  
  func startFlow() {
    navigation.push(view: PopToTypeFirstView(coordinator: self))
    navigation.push(view: PopToTypeSecondView(coordinator: self))
    navigation.push(view: PopToTypeLastView(coordinator: self))
  }
  
  func goToRoot() {
    navigation.pop(toViewType: PopToTypeRootView.self)
  }
  
  func goToFirst() {
    navigation.pop(toViewType: PopToTypeFirstView.self)
  }
  
  func goToSecond() {
    navigation.pop(toViewType: PopToTypeSecondView.self)
  }
}
