import SwiftUI

struct PresentRootView: View {
  var body: some View {
    VStack {
      Text("IsRootView")
    }
    .accessibilityIdentifier("PresentRootID")
  }
}

#Preview {
  PresentRootView()
}
