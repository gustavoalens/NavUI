import SwiftUI

struct NavUIView<ViewModel: NavUIViewModelProtocol, Root: View>: View {
  @ObservedObject var navigation: ViewModel
  let root: Root
  
  public var body: some View {
    NavigationStack(path: $navigation.path) {
      root
        .navigationDestination(for: StackedView.self, destination: { stackedView in
          AnyView(stackedView.view())
        })
        .sheet(item: $navigation.presenting) { stackedView in
          AnyView(stackedView.view())
        }
    }
  }
}
