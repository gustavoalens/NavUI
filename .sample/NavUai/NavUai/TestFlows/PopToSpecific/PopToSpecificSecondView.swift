import SwiftUI

struct PopToSpecificSecondView: View {
  let coordinator: PopToSpecificCoordinator
  
  var body: some View {
    VStack{
      Text("IsSecond")
      Button {
        coordinator.restart()
      } label: {
        Text("restart")
      }
    }
    .accessibilityIdentifier("PopToSpecificSecondID")
  }
}

//#Preview {
//    PopToSpecificSecondView()
//}
