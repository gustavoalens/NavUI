import SwiftUI

struct PopToTypeFirstView: View {
  let coordinator: PopToTypeCoordinator
  
  var body: some View {
    VStack{
      Text("IsFirst")
      Button {
        coordinator.restart()
      } label: {
        Text("restart")
      }
    }
    .accessibilityIdentifier("PopToTypeFirstID")
  }
}

//#Preview {
//    PopToTypeFirstView()
//}
