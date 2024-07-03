import SwiftUI

final public class Navigation {
  private let viewModel: NavUIViewModel = NavUIViewModel()
  
//  public var stack: [any View] { getStack() }
  
  public init() {
//    self.stack = []
  }
  
  public func push(view: any View) {
    viewModel.push(view: StackedView(view: { view }))
  }
  
  public func present(view: any View) {
    viewModel.present(view: StackedView(view: { view }))
  }
  
  public func start<Root: View>(root: Root) -> some View {
    let viewModel = viewModel
    return NavUIView(navigation: viewModel, root: root)
  }
  
//  private func getStack() -> [any View] {
//    
//  }
}
