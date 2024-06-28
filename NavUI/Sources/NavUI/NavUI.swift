import SwiftUI

final public class Navigation {
  private(set) var stack: [any View] = []
  private let viewModel: NavUIViewModel = NavUIViewModel()
  
  public init() {
    self.stack = []
  }
  
  public func push(view: any View) {
    viewModel.push(view: StackedView(view: { view }))
  }
  
  public func start<Root: View>(root: Root) -> some View {
    stack = [root]
    let viewModel = viewModel
    return NavUIView(navigation: viewModel, root: root)
  }
}

struct NavUIView<ViewModel: NavUIViewModelProtocol, Root: View>: View {
  @ObservedObject var navigation: ViewModel
  let root: Root
  
  public var body: some View {
    NavigationStack(path: $navigation.path) {
      root
        .navigationDestination(for: StackedView.self, destination: { stackedView in
          AnyView(stackedView.view())
        })
    }
  }
}


protocol NavUIViewModelProtocol: ObservableObject, AnyObject {
  var path: NavigationPath { get set }
  var stack: [StackedView] { get }
}

final class NavUIViewModel: NavUIViewModelProtocol {
  @Published var path: NavigationPath = .init()
  private(set) var stack: [StackedView] = []
  
  init() { }
  
  func push(view: StackedView) {
    path.append(view)
    stack.append(view)
  }
  
}

struct StackedView: Hashable {
  let id: UUID
  let view: () -> any View
  
  init(id: UUID = UUID(), view: @escaping () -> any View) {
    self.id = id
    self.view = view
  }
  
  static func == (lhs: StackedView, rhs: StackedView) -> Bool {
    lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func empty() -> StackedView {
    StackedView(id: UUID(), view: { EmptyView() })
  }
}



