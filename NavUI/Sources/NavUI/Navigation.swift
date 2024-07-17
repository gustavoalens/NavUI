import SwiftUI

final public class Navigation {
  @Published var path: NavigationPath = .init()
  @Published var presenting: StackedView?
  var _stack: [StackedView] = []
  public var stack: [StackedView] { _stack }
  var root: StackedView = .empty()
  
  public init() { }
  
  @discardableResult
  public func push(view: any View) -> StackedView {
    let stackedView = StackedView(view: { view })
    push(view: stackedView)
    return stackedView
  }
  
  public func push(stackedView: StackedView) {
    push(view: stackedView)
  }
  
  @discardableResult
  public func present(view: any View) -> StackedView {
    let stackedView = StackedView(view: { view })
    present(view: stackedView)
    return stackedView
  }
  
  @discardableResult
  public func popView() -> StackedView {
    return pop()
  }
  
  public func pop(toStackedView stackedView: StackedView) {
    pop(to: stackedView)
  }
  
  public func pop(toViewType viewType: any View.Type) {
    pop(to: viewType)
  }
  
  public func popToRootView() {
    popToRoot()
  }
  
  public func start<Root: View>(root: Root) -> some View {
    self.root = StackedView(view: { root })
    return NavUIView(viewModel: self, root: root)
  }
  
  public func start(root: StackedView) -> some View {
    self.root = root
    return NavUIView(viewModel: self, root: AnyView(root.view()))
  }
}
