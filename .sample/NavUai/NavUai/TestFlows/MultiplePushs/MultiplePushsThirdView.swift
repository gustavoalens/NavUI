import SwiftUI

struct MultiplePushsThirdView: View {
  let coordinator: MultiplePushsCoordinator
  
  var body: some View {
    VStack {
      Text("MultiplePushsThirdView")
//      Button {
////        coordinator.doThirdPush()
//      } label: {
//        Text("go Push")
//      }
    }
    .accessibilityIdentifier("MultiplePushsThirdID")
  }
}

//#Preview {
//    MultiplePushsThirdView()
//}

