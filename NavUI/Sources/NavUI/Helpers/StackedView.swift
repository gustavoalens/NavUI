import SwiftUI

public struct StackedView {
  public let id: UUID
  let view: () -> any View
  
  init(id: UUID = UUID(), view: @escaping () -> any View) {
    self.id = id
    self.view = view
  }
  
}

extension StackedView: Hashable, Identifiable {
  public static func == (lhs: StackedView, rhs: StackedView) -> Bool {
    lhs.id == rhs.id
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func empty() -> StackedView {
    StackedView(id: UUID(), view: { EmptyView() })
  }
  
  func getView() -> some View {
    AnyView(view())
  }
}
