import SwiftUI

struct PresentView: View {
  var body: some View {
    VStack {
      Text("IsPresentView")
    }
    .accessibilityIdentifier("PresentID")
  }
}

#Preview {
  PresentView()
}
