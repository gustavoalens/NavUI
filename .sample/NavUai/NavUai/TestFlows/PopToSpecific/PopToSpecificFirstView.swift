import SwiftUI

struct PopToSpecificFirstView: View {
  let coordinator: PopToSpecificCoordinator
  
  var body: some View {
    VStack{
      Text("IsFirst")
      Button {
        coordinator.restart()
      } label: {
        Text("restart")
      }
    }
    .accessibilityIdentifier("PopToSpecificFirstID")
  }
}

//#Preview {
//  PopToSpecificFirstView()
//}
