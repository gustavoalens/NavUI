import SwiftUI

struct PopSecondView: View {
  let coordinator: PopCoordinator
  
  var body: some View {
    VStack {
      Text("PopSecondView")
      Button {
        coordinator.back()
      } label: {
        Text("back")
      }
    }
    .accessibilityIdentifier("PopSecondID")
  }
}

//#Preview {
//    MultiplePushsFirstView()
//}

