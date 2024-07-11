import SwiftUI

struct MultiplePushsFirstView: View {
  let coordinator: MultiplePushsCoordinator
  
  var body: some View {
    VStack {
      Text("MultiplePushsFirstView")
      Button {
        coordinator.doSecondPush()
      } label: {
        Text("goSecondPush")
      }
    }
    .accessibilityIdentifier("MultiplePushsFirstID")
  }
}

//#Preview {
//    MultiplePushsFirstView()
//}

