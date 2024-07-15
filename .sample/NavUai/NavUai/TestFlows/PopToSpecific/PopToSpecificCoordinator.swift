import NavUI
import SwiftUI

final class PopToSpecificCoordinator {
  let navigation: Navigation
  lazy var rootView: StackedView = StackedView(view: { PopToSpecificRootView(coordinator: self) })
  lazy var firstView: StackedView = StackedView(view: { PopToSpecificFirstView(coordinator: self) })
  lazy var secondView: StackedView = StackedView(view: { PopToSpecificSecondView(coordinator: self) })
  lazy var lastView: StackedView = StackedView(view: { PopToSpecificLastView(coordinator: self) })
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    let root = navigation.start(root: rootView)
    startFlow()
    return AnyView(root)
  }
  
  func restart() {
    navigation.popToRootView()
    startFlow()
  }
  
  func startFlow() {
    navigation.push(stackedView: firstView)
    navigation.push(stackedView: secondView)
    navigation.push(stackedView: lastView)
  }
  
  func goToRoot() {
    navigation.pop(toStackedView: rootView)
  }
  
  func goToFirst() {
    navigation.pop(toStackedView: firstView)
  }
  
  func goToSecond() {
    navigation.pop(toStackedView: secondView)
  }
}
