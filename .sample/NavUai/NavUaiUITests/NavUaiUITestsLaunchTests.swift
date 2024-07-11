import XCTest

final class NavUaiUITestsLaunchTests: XCTestCase {
  
  override class var runsForEachTargetApplicationUIConfiguration: Bool {
    true
  }
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  func test_start_root() throws {
    let app = XCUIApplication()
    app.launch()
    XCTAssertTrue(app.staticTexts["RootTitleID"].label == "Is RootView")
  }
  
  func test_push_screen() throws {
    let app = launchTestFlow(id: "push")
    
    XCTAssertTrue(app.staticTexts["PushRootID"].waitForExistence(timeout: 1))
    app.buttons["Next"].tap()
    XCTAssertTrue(app.staticTexts["PushFirstID"].waitForExistence(timeout: 1))
    
    app.navigationBars.buttons.element(boundBy: 0).tap()
    XCTAssertTrue(app.staticTexts["PushRootID"].waitForExistence(timeout: 1))
  }
  
  func test_multiple_pushs() throws {
    let app = launchTestFlow(id: "multiplePushs")
    
    XCTAssertTrue(app.staticTexts["MultiplePushsRootID"].waitForExistence(timeout: 1))
    app.buttons["goFirstPush"].tap()
    XCTAssertTrue(app.staticTexts["MultiplePushsFirstID"].waitForExistence(timeout: 1))
    app.buttons["goSecondPush"].tap()
    XCTAssertTrue(app.staticTexts["MultiplePushsSecondID"].waitForExistence(timeout: 1))
    app.buttons["goThirdPush"].tap()
    XCTAssertTrue(app.staticTexts["MultiplePushsThirdID"].waitForExistence(timeout: 1))
    
    
    app.navigationBars.buttons.element(boundBy: 0).tap()
    XCTAssertTrue(app.staticTexts["MultiplePushsSecondID"].waitForExistence(timeout: 1))
    app.navigationBars.buttons.element(boundBy: 0).tap()
    XCTAssertTrue(app.staticTexts["MultiplePushsFirstID"].waitForExistence(timeout: 1))
    app.navigationBars.buttons.element(boundBy: 0).tap()
    XCTAssertTrue(app.staticTexts["MultiplePushsRootID"].waitForExistence(timeout: 1))
  }
  
  func test_pop_view() throws {
    let app = launchTestFlow(id: "popView")
  }
  
  func test_pop_to_root() throws {
    let app = launchTestFlow(id: "popToRoot")
    
  }
  
  func test_pop_to_specific() throws {
    let app = launchTestFlow(id: "popToSpecific")
  }
  
  func test_pop_to_type() throws {
    let app = launchTestFlow(id: "popToType")
  }
  
  private func launchTestFlow(id: String) -> XCUIApplication {
    let app = XCUIApplication()
    app.launchEnvironment["TestFlowID"] = id
    app.launch()
    return app
  }
}
