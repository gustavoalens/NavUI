import SwiftUI

struct PopToRootSecondView: View {
  let coordinator: PopToRootCoordinator
  
  var body: some View {
    VStack {
      Text("PopFirstView")
      Button {
        coordinator.goToRoot()
      } label: {
        Text("goToRoot")
      }
    }
    .accessibilityIdentifier("PopToRootSecondID")
  }
}

//#Preview {
//    MultiplePushsFirstView()
//}

