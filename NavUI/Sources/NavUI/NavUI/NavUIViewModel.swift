import SwiftUI

protocol NavUIViewModelProtocol: ObservableObject, AnyObject {
  var path: NavigationPath { get set }
  var stack: [StackedView] { get }
  var presenting: StackedView? { get set }
}

final class NavUIViewModel: NavUIViewModelProtocol {
  @Published var path: NavigationPath = .init()
  @Published var presenting: StackedView?
  private(set) var stack: [StackedView] = []
  
  init() { }
  
  func push(view: StackedView) {
    path.append(view)
    stack.append(view)
  }
  
  func present(view: StackedView) {
    presenting = view
  }
}
