import SwiftUI

struct MultiplePushsRootView: View {
  let coordinator: MultiplePushsCoordinator
  
  var body: some View {
    VStack {
      Text("MultiplePushsRootView")
      Button {
        coordinator.doFirstPush()
      } label: {
        Text("goFirstPush")
      }
    }
    .accessibilityIdentifier("MultiplePushsRootID")
  }
}
//
//#Preview {
//  MultiplePushsRootView()
//}
