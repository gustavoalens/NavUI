import SwiftUI

struct TestView: View, Identifiable, Equatable {
  let id: UUID = .init()
  
  var body: some View {
    Text("Is Test View \(id)")
  }
}

#Preview {
  TestView()
}
