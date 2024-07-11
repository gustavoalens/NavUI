import SwiftUI

struct PopRootView: View {
  let coordinator: PopCoordinator
  
  var body: some View {
    VStack {
      Text("PopRootView")
      Button {
        coordinator.doFirstPush()
      } label: {
        Text("goFirstPush")
      }
    }
    .accessibilityIdentifier("PopRootID")
  }
}
//
//#Preview {
//  MultiplePushsRootView()
//}
