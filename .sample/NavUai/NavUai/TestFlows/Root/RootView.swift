import SwiftUI

struct RootView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Is \(String(describing: RootView.self))")
        .accessibilityIdentifier("RootTitleID")
    }
    .padding()
  }
}

#Preview {
  RootView()
}
