import SwiftUI

struct PopToTypeSecondView: View {
  let coordinator: PopToTypeCoordinator
  
  var body: some View {
    VStack{
      Text("IsSecond")
      Button {
        coordinator.restart()
      } label: {
        Text("restart")
      }
    }
    .accessibilityIdentifier("PopToTypeSecondID")
  }
}

//#Preview {
//    PopToTypeSecondView()
//}
