import NavUI
import SwiftUI

final class TestsCoordinator {
  let navigation = Navigation()
  
  func start() -> some View {
    guard let flowID = ProcessInfo.processInfo.environment["TestFlowID"],
          let flow = TestFlow(rawValue: flowID) else {
      return AnyView(EmptyView())
    }
    return getFlowStart(flow: flow)
  }
  
  private func getFlowStart(flow: TestFlow) -> AnyView {
    switch flow {
      case .root:
        return AnyView(navigation.start(root: RootView()))
        
      case .push:
        return AnyView(PushCoordinator(navigation: navigation).start())
        
      case .multiplePushs:
        return AnyView(MultiplePushsCoordinator(navigation: navigation).start())
        
      case .pop:
        return AnyView(PopCoordinator(navigation: navigation).start())
        
      case .popToRoot:
        return AnyView(PopToRootCoordinator(navigation: navigation).start())
        
      case .popToSpecific:
        return AnyView(PopToSpecificCoordinator(navigation: navigation).start())
        
      case .popToType:
        return AnyView(PopToTypeCoordinator(navigation: navigation).start())
        
    }
  }
}

enum TestFlow: String {
  case root
  case push
  case multiplePushs
  case pop
  case popToRoot
  case popToSpecific
  case popToType
}
