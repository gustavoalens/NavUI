import SwiftUI

struct PushRootView: View {
  let coordinator: PushCoordinator
  
    var body: some View {
      VStack {
        Text("IsPushRootView")
          .accessibilityIdentifier("ViewTitleID")
        Button {
          coordinator.doPush()
        } label: {
          Text("Next")
        }
      }
      .padding()
      .accessibilityIdentifier("PushRootID")
    }
}
//
//#Preview {
//    PushRootView(coordinator: PushCoordinator(navigation: Navigation()))
//}
