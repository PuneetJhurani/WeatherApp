//
//  WeatherViewModelTest.swift
//  WeatherAppTests
//
//  Created by Nagarro on 23/02/24.
//

import XCTest
@testable import WeatherApp

class  WeatherViewModelTests: XCTestCase {
        
        
       var weatherViewModel: WeatherViewModel?
        
       override  func setUp() {

           weatherViewModel = WeatherViewModel(
                repository: MockRepository(),
                analyticsHelper: AnalyticsHelper.getInstance()
            )
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }

        func testInitialization() throws {

            let locaPreferencesTest = LocalPreferences.getInstance()
            XCTAssertNotNil(locaPreferencesTest)
        }


        func testEncryptionHelper() throws {
            XCTAssertNotNil(EncryptionHelper.getInstance())
        }

        
        func testEmptyPinCode(){
            
            weatherViewModel?.fetchWeatherForeCast(pincode: "")
            XCTAssertFalse((weatherViewModel?.isLoading)!)
            XCTAssertEqual(weatherViewModel?.errorMessage, "Empty pincode")
            
        }

        func testViewModelSuccess() {

            let expectation = XCTestExpectation(
                description: "Fetch data"
            )

            weatherViewModel?.fetchWeatherForeCast(pincode: "110088")
            DispatchQueue.main.async { [weak self] in
                XCTAssertEqual(self?.weatherViewModel?.weeklyWeatherForecast[0].weather?[0].description , "clear sky")
                      expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 2.0)

        }
    }
