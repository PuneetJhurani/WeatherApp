//
//  WeatherAppUITests.swift
//  WeatherAppUITests
//
//  Created by Nagarro on 21/02/24.
//

import XCTest

final class WeatherAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override  func setUp() {
        app = XCUIApplication()
        app!.launchArguments =  ["enable-testing"]
        app!.launch()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmptyPinCode() {
        app.textFields["Pincode"].tap()
        app.textFields["Pincode"].typeText("")
        app.buttons["Search"].tap()
        XCTAssertTrue(app.staticTexts["Empty pincode"].waitForExistence(timeout: 2.0 ),  "Message not found")
    }
    
    func testWeatherForecast() {
        
        app.textFields["Pincode"].tap()
        app.textFields["Pincode"].typeText("110088")
        app.buttons["Search"].tap()
        XCTAssertTrue(app.collectionViews["ForecastList"].waitForExistence(timeout: 5.0), "Forecast not found")
    }

}
