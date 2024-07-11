import SwiftUI

struct MultiplePushsSecondView: View {
  let coordinator: MultiplePushsCoordinator
  
  var body: some View {
    VStack {
      Text("MultiplePushsSecondView")
      Button {
        coordinator.doThirdPush()
      } label: {
        Text("goThirdPush")
      }
    }
    .accessibilityIdentifier("MultiplePushsSecondID")
  }
}

//#Preview {
//    MultiplePushsSecondView()
//}

