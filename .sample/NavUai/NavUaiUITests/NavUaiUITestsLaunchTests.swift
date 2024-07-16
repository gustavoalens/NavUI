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
    let app = launchTestFlow(id: "pop")
    
    XCTAssertTrue(app.staticTexts["PopSecondID"].waitForExistence(timeout: 1))
    app.buttons["back"].tap()
    XCTAssertTrue(app.staticTexts["PopFirstID"].waitForExistence(timeout: 1))
    app.buttons["back"].tap()
    XCTAssertTrue(app.staticTexts["PopRootID"].waitForExistence(timeout: 1))
  }
  
  func test_pop_to_root() throws {
    let app = launchTestFlow(id: "popToRoot")

    app.buttons["goToRoot"].tap()
    XCTAssertTrue(app.staticTexts["PopToRootRootID"].waitForExistence(timeout: 1))
    
    app.buttons["tryRootInRoot"].tap()
    XCTAssertTrue(app.staticTexts["PopToRootRootID"].waitForExistence(timeout: 1))
  }
  
  func test_pop_to_specific() throws {
    let app = launchTestFlow(id: "popToSpecific")
    
    XCTAssertTrue(app.staticTexts["PopToSpecificLastID"].waitForExistence(timeout: 1))
    app.buttons["goToRoot"].tap()
    XCTAssertTrue(app.staticTexts["PopToSpecificRootID"].waitForExistence(timeout: 1))
    
    app.buttons["restart"].tap()
    XCTAssertTrue(app.staticTexts["PopToSpecificLastID"].waitForExistence(timeout: 1))
    
    app.buttons["goToFirst"].tap()
    XCTAssertTrue(app.staticTexts["PopToSpecificFirstID"].waitForExistence(timeout: 1))
    
    app.buttons["restart"].tap()
    XCTAssertTrue(app.staticTexts["PopToSpecificLastID"].waitForExistence(timeout: 1))
    
    app.buttons["goToSecond"].tap()
    XCTAssertTrue(app.staticTexts["PopToSpecificSecondID"].waitForExistence(timeout: 1))
  }
  
  func test_pop_to_type() throws {
    let app = launchTestFlow(id: "popToType")
    
    
    XCTAssertTrue(app.staticTexts["PopToTypeLastID"].waitForExistence(timeout: 1))
    app.buttons["goToRoot"].tap()
    XCTAssertTrue(app.staticTexts["PopToTypeRootID"].waitForExistence(timeout: 1))
    
    app.buttons["restart"].tap()
    XCTAssertTrue(app.staticTexts["PopToTypeLastID"].waitForExistence(timeout: 1))
    
    app.buttons["goToFirst"].tap()
    XCTAssertTrue(app.staticTexts["PopToTypeFirstID"].waitForExistence(timeout: 1))
    
    app.buttons["restart"].tap()
    XCTAssertTrue(app.staticTexts["PopToTypeLastID"].waitForExistence(timeout: 1))
    
    app.buttons["goToSecond"].tap()
    XCTAssertTrue(app.staticTexts["PopToTypeSecondID"].waitForExistence(timeout: 1))
  }
  
  func test_present() throws {
    let app = launchTestFlow(id: "present")
    XCTAssertTrue(app.staticTexts["PresentRootID"].waitForExistence(timeout: 1))
    XCTAssertTrue(app.staticTexts["PresentID"].waitForExistence(timeout: 1))
  }
  
  private func launchTestFlow(id: String) -> XCUIApplication {
    let app = XCUIApplication()
    app.launchEnvironment["TestFlowID"] = id
    app.launch()
    return app
  }
}
