import XCTest
@testable import NavUI
import SwiftUI

final class NavUITests: XCTestCase {
    
    private let typedViews: [any IdentifiableView] = [
        TestTypedView<Int>(),
        TestTypedView<Float>(),
        TestTypedView<Double>(),
        TestTypedView<String>(),
        TestTypedView<AnyView>(),
        TestTypedView<TestView>(),
        TestTypedView<NavUITests>(),
        TestTypedView<Bool>(),
        TestTypedView<Array<Int>>(),
        TestTypedView<Array<Float>>(),
        TestTypedView<Array<Double>>(),
        TestTypedView<Array<String>>(),
        TestTypedView<Array<AnyView>>(),
        TestTypedView<Array<TestView>>(),
        TestTypedView<Array<NavUITests>>(),
        TestTypedView<Array<Bool>>(),
        TestTypedView<Set<Int>>(),
        TestTypedView<Set<Float>>(),
        TestTypedView<Set<Double>>(),
        TestTypedView<Set<String>>(),
        TestTypedView<Set<NavUITests>>(),
        TestTypedView<Set<Bool>>(),
    ]
    
    func test_push_increases_stack_and_path() {
        let nav = Navigation()
        for (index, item) in typedViews.enumerated() {
            nav.push(view: item)
            XCTAssertEqual(nav.stack.count, index + 1)
            XCTAssertEqual(nav.path.count, index + 1)
            XCTAssertTrue(type(of: nav.stack[index]) == type(of: item))
        }
    }
    
    func test_pop_removes_last() {
        let nav = Navigation()
        typedViews.forEach { nav.push(view: $0) }
        while !nav.path.isEmpty {
            let previousCount = nav.stack.count
            nav.pop()
            XCTAssertEqual(nav.stack.count, previousCount - 1)
            XCTAssertEqual(nav.path.count, previousCount - 1)
        }
        XCTAssertTrue(nav.stack.isEmpty)
        XCTAssertEqual(nav.path.count, 0)
    }
    
    func test_popToRoot_clears_stack_and_path() {
        let nav = Navigation()
        typedViews.prefix(10).forEach { nav.push(view: $0) }
        nav.popToRoot()
        XCTAssertTrue(nav.stack.isEmpty)
        XCTAssertEqual(nav.path.count, 0)
    }
    
    func test_pop_to_viewType() {
        let nav = Navigation()
        nav.push(view: TestTypedView<Int>())
        nav.push(view: TestTypedView<String>())
        nav.push(view: TestTypedView<Double>())
        nav.pop(to: TestTypedView<String>.self)
        XCTAssertEqual(nav.stack.count, 2)
        XCTAssertTrue(nav.stack.last is TestTypedView<String>)
    }
    
    func test_present_sets_presenting() {
        let nav = Navigation()
        XCTAssertNil(nav.presenting)
        let presented = TestTypedView<Int>()
        nav.present(view: presented)
        XCTAssertNotNil(nav.presenting)
        XCTAssertTrue(type(of: nav.presenting!) == TestTypedView<Int>.self)
    }
    
    func test_push_then_present_then_push_more() {
        let nav = Navigation()
        nav.push(view: typedViews[0])
        nav.push(view: typedViews[1])
        nav.present(view: typedViews[2])
        XCTAssertNotNil(nav.presenting)
        XCTAssertEqual(nav.stack.count, 2)
        nav.push(view: typedViews[3])
        XCTAssertEqual(nav.stack.count, 3)
        XCTAssertNotNil(nav.presenting)
    }
    
    class Navigation: NavGator {
        var stack: [any NavUI.IdentifiableView] = []
        var presenting: (any NavUI.IdentifiableView)? = nil
        var path: NavigationPath = NavigationPath()
        typealias Item = TestTypedView<Any>
    }
}
