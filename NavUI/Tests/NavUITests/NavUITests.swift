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
    let navigation = Navigation()
    var pushedViews: [StackedView] = []
    _ = navigation.start(root: TestView())
    typedViews.forEach { typedView in
      pushedViews.append(navigation.push(view: typedView.view))
    }
    Array(0..<typedViews.count).reversed().forEach { specificIndex in
      XCTAssert(type(of: typedViews.last?.view) == type(of: navigation.stack.last?.view()))
      navigation.pop(toViewType: typedViews[specificIndex].type)
      XCTAssert(typedViews[specificIndex].isType(navigation.stack.last?.view()))
      navigation.pop(toViewType: TestView.self)
      XCTAssert(navigation.stack.isEmpty)
      typedViews.forEach { typedView in
        pushedViews.append(navigation.push(view: typedView.view))
      }
    }
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
  
  private let typedViews: [TypedViewTest] = [
    .init(view: TestTypedView<Int>(), type: TestTypedView<Int>.self, isType: { $0 as? TestTypedView<Int> != nil }),
    .init(view: TestTypedView<Float>(), type: TestTypedView<Float>.self, isType: { $0 as? TestTypedView<Float> != nil }),
    .init(view: TestTypedView<Double>(), type: TestTypedView<Double>.self, isType: { $0 as? TestTypedView<Double> != nil }),
    .init(view: TestTypedView<String>(), type: TestTypedView<String>.self, isType: { $0 as? TestTypedView<String> != nil }),
    .init(view: TestTypedView<AnyView>(), type: TestTypedView<AnyView>.self, isType: { $0 as? TestTypedView<AnyView> != nil }),
    .init(view: TestTypedView<Navigation>(), type: TestTypedView<Navigation>.self, isType: { $0 as? TestTypedView<Navigation> != nil }),
    .init(view: TestTypedView<TestView>(), type: TestTypedView<TestView>.self, isType: { $0 as? TestTypedView<TestView> != nil }),
    .init(view: TestTypedView<NavUITests>(), type: TestTypedView<NavUITests>.self, isType: { $0 as? TestTypedView<NavUITests> != nil }),
    .init(view: TestTypedView<StackedView>(), type: TestTypedView<StackedView>.self, isType: { $0 as? TestTypedView<StackedView> != nil }),
    .init(view: TestTypedView<Bool>(), type: TestTypedView<Bool>.self, isType: { $0 as? TestTypedView<Bool> != nil }),
    .init(view: TestTypedView<Array<Int>>(), type: TestTypedView<Array<Int>>.self, isType: { $0 as? TestTypedView<Array<Int>> != nil }),
    .init(view: TestTypedView<Array<Float>>(), type: TestTypedView<Array<Float>>.self, isType: { $0 as? TestTypedView<Array<Float>> != nil }),
    .init(view: TestTypedView<Array<Double>>(), type: TestTypedView<Array<Double>>.self, isType: { $0 as? TestTypedView<Array<Double>> != nil }),
    .init(view: TestTypedView<Array<String>>(), type: TestTypedView<Array<String>>.self, isType: { $0 as? TestTypedView<Array<String>> != nil }),
    .init(view: TestTypedView<Array<AnyView>>(), type: TestTypedView<Array<AnyView>>.self, isType: { $0 as? TestTypedView<Array<AnyView>> != nil }),
    .init(view: TestTypedView<Array<Navigation>>(), type: TestTypedView<Array<Navigation>>.self, isType: { $0 as? TestTypedView<Array<Navigation>> != nil }),
    .init(view: TestTypedView<Array<TestView>>(), type: TestTypedView<Array<TestView>>.self, isType: { $0 as? TestTypedView<Array<TestView>> != nil }),
    .init(view: TestTypedView<Array<NavUITests>>(), type: TestTypedView<Array<NavUITests>>.self, isType: { $0 as? TestTypedView<Array<NavUITests>> != nil }),
    .init(view: TestTypedView<Array<StackedView>>(), type: TestTypedView<Array<StackedView>>.self, isType: { $0 as? TestTypedView<Array<StackedView>> != nil }),
    .init(view: TestTypedView<Array<Bool>>(), type: TestTypedView<Array<Bool>>.self, isType: { $0 as? TestTypedView<Array<Bool>> != nil }),
    .init(view: TestTypedView<Set<Int>>(), type: TestTypedView<Set<Int>>.self, isType: { $0 as? TestTypedView<Set<Int>> != nil }),
    .init(view: TestTypedView<Set<Float>>(), type: TestTypedView<Set<Float>>.self, isType: { $0 as? TestTypedView<Set<Float>> != nil }),
    .init(view: TestTypedView<Set<Double>>(), type: TestTypedView<Set<Double>>.self, isType: { $0 as? TestTypedView<Set<Double>> != nil }),
    .init(view: TestTypedView<Set<String>>(), type: TestTypedView<Set<String>>.self, isType: { $0 as? TestTypedView<Set<String>> != nil }),
    .init(view: TestTypedView<Set<NavUITests>>(), type: TestTypedView<Set<NavUITests>>.self, isType: { $0 as? TestTypedView<Set<NavUITests>> != nil }),
    .init(view: TestTypedView<Set<Bool>>(), type: TestTypedView<Set<Bool>>.self, isType: { $0 as? TestTypedView<Set<Bool>> != nil }),
  ]
  
  private struct TypedViewTest {
    let view: any View
    let type: any View.Type
    let isType: (_ resultView: (any View)?) -> Bool
  }
}
