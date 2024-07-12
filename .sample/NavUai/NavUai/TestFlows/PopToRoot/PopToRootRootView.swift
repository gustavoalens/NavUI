import SwiftUI

struct PopToRootRootView: View {
  let coordinator: PopToRootCoordinator
  
  var body: some View {
    VStack {
      Text("PopRootView")
      Button {
        coordinator.goToRoot()
      } label: {
        Text("tryRootInRoot")
      }
    }
    .accessibilityIdentifier("PopToRootRootID")
  }
}
//
//#Preview {
//  MultiplePushsRootView()
//}
