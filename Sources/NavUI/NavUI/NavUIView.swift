import SwiftUI

struct NavUIView<ViewModel: NavUIViewModelProtocol, Root: View>: View {
  @ObservedObject var viewModel: ViewModel
  let root: Root
  
  public var body: some View {
    NavigationStack(path: $viewModel.path) {
      root
        .navigationDestination(for: StackedView.self, destination: { stackedView in
          stackedView.getView()
        })
        .sheet(item: $viewModel.presenting) { stackedView in
          AnyView(stackedView.view())
        }
    }
  }
}
