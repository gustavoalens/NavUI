import SwiftUI

struct PopToTypeLastView: View {
  let coordinator: PopToTypeCoordinator
  
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
    .accessibilityIdentifier("PopToTypeLastID")
  }
}

//#Preview {
//    PopToTypeLastView()
//}
