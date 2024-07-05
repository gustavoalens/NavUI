import SwiftUI

extension Navigation: NavUIViewModelProtocol {
  func push(view: StackedView) {
    path.append(view)
    _stack.append(view)
  }
  
  func present(view: StackedView) {
    presenting = view
  }
  
  func pop() -> StackedView {
    if let presenting {
      self.presenting = nil
      return presenting
    }
    path.removeLast()
    return _stack.removeLast()
  }
  
  func pop(to stackedView: StackedView) {
    guard let index = _stack.lastIndex(of: stackedView) else {
      if stackedView == root {
        popToRoot()
      }
      return
    }
    popTo(index: index)
  }
  
  func pop<ViewType: View>(to viewType: ViewType.Type) {
    guard let index = _stack.lastIndex(where: { $0.view() is ViewType }) else {
      if root.view() is ViewType {
        popToRoot()
      }
      return
    }
    popTo(index: index)
  }
  
  func popToRoot() {
    guard !path.isEmpty else { return }
    path.removeLast(_stack.count)
    _stack.removeAll()
  }
  
  private func popTo(index: Int) {
    let olderCount = _stack.count
    _stack = Array(_stack[...index])
    let diff = olderCount - _stack.count
    path.removeLast(diff)
  }
}
