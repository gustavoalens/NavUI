import SwiftUI

final public class Navigation {
  @Published var path: NavigationPath = .init()
  @Published var presenting: StackedView?
  var _stack: [StackedView] = []
  public var stack: [StackedView] { _stack }
  
  public init() { }
  
  @discardableResult
  public func push(view: any View) -> StackedView {
    let stackedView = StackedView(view: { view })
    push(view: stackedView)
    return stackedView
  }
  
  @discardableResult
  public func present(view: any View) -> StackedView {
    let stackedView = StackedView(view: { view })
    present(view: stackedView)
    return stackedView
  }
  
  public func popView() -> StackedView {
    return pop()
  }
  
  public func pop(toStackedView stackedView: StackedView) {
    pop(to: stackedView)
  }
  
  public func popToRootView() {
    popToRoot()
  }
  
  public func start<Root: View>(root: Root) -> some View {
    return NavUIView(viewModel: self, root: root)
  }
}
