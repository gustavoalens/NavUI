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
    let olderCount = _stack.count
    guard let index = _stack.lastIndex(of: stackedView) else { return }
    _stack = Array(_stack[...index])
    let diff = olderCount - _stack.count
    path.removeLast(diff)
  }
  
  func popToRoot() {
    guard !path.isEmpty else { return }
    path.removeLast(_stack.count)
    _stack.removeAll()
  }
}
