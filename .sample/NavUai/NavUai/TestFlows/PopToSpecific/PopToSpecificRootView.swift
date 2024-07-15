import SwiftUI

struct PopToSpecificRootView: View {
  let coordinator: PopToSpecificCoordinator
  
  var body: some View {
    VStack{
      Text("IsRoot")
      Button {
        coordinator.restart()
      } label: {
        Text("restart")
      }
    }
    .accessibilityIdentifier("PopToSpecificRootID")
  }
}

//#Preview {
//    PopToSpecificRootView()
//}
