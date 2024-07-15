import SwiftUI

struct PopToTypeRootView: View {
  let coordinator: PopToTypeCoordinator
  
  var body: some View {
    VStack{
      Text("IsRoot")
      Button {
        coordinator.restart()
      } label: {
        Text("restart")
      }
    }
    .accessibilityIdentifier("PopToTypeRootID")
  }
}

//#Preview {
//    PopToTypeRootView()
//}
