import SwiftUI

struct PopToSpecificLastView: View {
  let coordinator: PopToSpecificCoordinator
  
  var body: some View {
    VStack{
      Text("IsLast")
      Button {
        coordinator.goToRoot()
      } label: {
        Text("goToRoot")
      }
      Button {
        coordinator.goToFirst()
      } label: {
        Text("goToFirst")
      }
      Button {
        coordinator.goToSecond()
      } label: {
        Text("goToSecond")
      }
    }
    .accessibilityIdentifier("PopToSpecificLastID")
  }
}

//#Preview {
//    PopToSpecificLastView()
//}
