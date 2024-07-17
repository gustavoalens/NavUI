import XCTest
@testable import NavUI
import SwiftUI

final class NavUITests: XCTestCase {
  
  func test_view_stackView() throws {
    let views: [TestView] = .init(repeating: TestView(), count: 1000)
    views.forEach { view in
      let stackedView = StackedView(view: { view })
      XCTAssert(stackedView.view() as? TestView == view)
    }
  }
  
  func test_start_root() throws {
    let navigation = Navigation()
    let view = TestView()
    _ = navigation.start(root: view)
    XCTAssert((navigation.root.view() as? TestView) == view)
  }
  
  func test_push_screen() throws {
    let navigation = Navigation()
    let views: [TestView] = .init(repeating: TestView(), count: 1000)
    _ = navigation.start(root: TestView())
    views.enumerated().forEach { index, view in
      navigation.push(view: view)
      XCTAssert(navigation.stack.count == index + 1)
      XCTAssert(navigation.stack[index].view() as? TestView == views[index])
    }
  }
  
  func test_push_stackedView() throws {
    let navigation = Navigation()
    let views: [TestView] = .init(repeating: TestView(), count: 1000)
    _ = navigation.start(root: TestView())
    views.enumerated().forEach { index, view in
      navigation.push(stackedView: StackedView(view: { view }))
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
    XCTAssert(navigation.popView().view() as? TestView == presentingTestView)
    
    Array(0..<views.count).reversed().forEach { index in
      let lastView = navigation.stack.last?.view() as? TestView
      let popedView = navigation.popView().view() as? TestView
      XCTAssert(popedView == lastView)
      XCTAssert(popedView == views[index])
      XCTAssert(views[safe: index - 1] == navigation.stack[safe: index - 1]?.view() as? TestView)
    }
    navigation.present(view: presentingTestView)
    XCTAssert(navigation.popView().view() as? TestView == presentingTestView)
    XCTAssert(navigation.stack.isEmpty)
  }
  
  func test_pop_to_root() throws {
    let navigation = Navigation()
    let views: [TestView] = .init(repeating: TestView(), count: 1000)
    _ = navigation.start(root: TestView())
    Array(0..<1000).forEach { index in
      Array(0...index).forEach { pushIndex in
        navigation.push(view: views[pushIndex])
      }
      XCTAssert(navigation.stack.count == index + 1)
      navigation.popToRootView()
      XCTAssert(navigation.stack.isEmpty)
    }
  }
  
  func test_pop_to_specific() throws {
    let navigation = Navigation()
    let views: [TestView] = .init(repeating: TestView(), count: 1000)
    let root: TestView = TestView()
    var pushedViews: [StackedView] = []
    _ = navigation.start(root: root)
    views.forEach { view in
      pushedViews.append(navigation.push(view: view))
    }
    Array(0..<1000).reversed().forEach { specificIndex in
      XCTAssert(views.last == navigation.stack.last?.view() as? TestView)
      navigation.pop(toStackedView: pushedViews[specificIndex])
      XCTAssert(views[specificIndex] == navigation.stack.last?.view() as? TestView)
      navigation.pop(toStackedView: navigation.root)
      XCTAssert(navigation.stack.isEmpty)
      views.forEach { view in
        pushedViews.append(navigation.push(view: view))
      }
    }
  }
  
  func test_pop_to_type() throws { 
    
  }
  
  func test_present() throws {
    let navigation = Navigation()
    let views: [TestView] = .init(repeating: TestView(), count: 1000)
    _ = navigation.start(root: TestView())
    XCTAssert(navigation.presenting == nil)
    views.forEach { view in
      navigation.present(view: view)
      XCTAssert(navigation.presenting?.view() as? TestView == view)
      navigation.push(view: view)
    }
  }
}
