import XCTest
@testable import NavUI
import SwiftUI

final class NavUITests: XCTestCase {
  
  func test_start_root() throws {
    let navigation = Navigation()
    let view = TestView()
    _ = navigation.start(root: view)
    XCTAssert((navigation.root.view() as? TestView) == view)
  }
  
  func test_push_screen() throws {
    let navigation = Navigation()
    let rootView = TestView()
    let pushedView = TestView()
    _ = navigation.start(root: rootView)
    navigation.push(view: pushedView)
    XCTAssert(navigation.stack.count == 1)
    XCTAssert(navigation.stack[0].view() as? TestView == pushedView)
  }
  
  func test_multiple_pushs() throws {
    let navigation = Navigation()
    let views: [TestView] = .init(repeating: TestView(), count: 1000)
    views.enumerated().forEach { index, view in
      navigation.push(view: view)
      XCTAssert(navigation.stack.count == index + 1)
      XCTAssert(navigation.stack[index].view() as? TestView == views[index])
    }
  }
  
  func test_pop_view() throws {
    let navigation = Navigation()
    let views: [TestView] = .init(repeating: TestView(), count: 1000)
    views.forEach { view in
      navigation.push(view: view)
    }
    
    let presentingTestView = TestView()
    navigation.present(view: presentingTestView)
    XCTAssert(navigation.pop().view() as? TestView == presentingTestView)
    
    Array(0..<views.count).reversed().forEach { index in
      let lastView = navigation.stack.last?.view() as? TestView
      let popedView = navigation.pop().view() as? TestView
      XCTAssert(popedView == lastView)
      XCTAssert(popedView == views[index])
      XCTAssert(views[safe: index - 1] == navigation.stack[safe: index - 1]?.view() as? TestView)
    }
    navigation.present(view: presentingTestView)
    XCTAssert(navigation.pop().view() as? TestView == presentingTestView)
    XCTAssert(navigation.stack.isEmpty)
  }
  
  func test_pop_to_root() throws {
    
  }
  
  func test_pop_to_specific() throws {
    
  }
  
  func test_pop_to_type() throws { 
    
  }
  
  func test_present() throws {
    
  }
}

extension Array {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
