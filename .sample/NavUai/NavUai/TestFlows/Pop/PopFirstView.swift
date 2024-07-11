import SwiftUI

struct PopFirstView: View {
  let coordinator: PopCoordinator
  
  var body: some View {
    VStack {
      Text("PopFirstView")
      Button {
        coordinator.back()
      } label: {
        Text("back")
      }
    }
    .accessibilityIdentifier("PopFirstID")
  }
}

//#Preview {
//    MultiplePushsFirstView()
//}

