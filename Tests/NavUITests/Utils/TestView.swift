import SwiftUI
@testable import NavUI

struct TestView: View, Identifiable, Equatable {
  let id: UUID = .init()
  
  var body: some View {
    Text("Is Test View \(id)")
  }
}

#Preview {
  TestView()
}

struct TestTypedView<T>: IdentifiableView {
  let id: UUID = .init()
  
  var destination: some View {
      Text("Is Test View Type \(String(describing: T.self))")
  }
}
