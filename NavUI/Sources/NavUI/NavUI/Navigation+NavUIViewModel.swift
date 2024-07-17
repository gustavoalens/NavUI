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
  
  func pop(to viewType: any View.Type) {
    guard let index = _stack.lastIndex(where: { type(of: $0.view()) == viewType }) else {
      if type(of:root.view()) == viewType {
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
