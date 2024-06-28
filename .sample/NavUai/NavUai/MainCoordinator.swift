import NavUI
import SwiftUI

final class MainCoordinator {
  let navigation = Navigation()
  
  func start() -> some View {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
      self.goToSecond()
    }
    return navigation.start(root: Text("first").background(Color.blue))
  }
  
  func goToSecond() {
    navigation.push(view: Text("Second").background(Color.red))
  }
}
