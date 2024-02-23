//
//  RepositoryTestCases.swift
//  ArchitectureBiolerplateTests
//
//  Created by Puneet jhurani  on 25/09/23.
//

import XCTest
@testable import WeatherApp

class RepositoryTestCases: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testGetEntityWithSuccess() throws{

        let apiManager = MockApiManager()
        let repository = WeatherRepository(apiManager: apiManager)
        
        repository.getEntity(pincode: "110088") { resource
             in
            XCTAssertEqual(resource.data?.list?[0].weather?[0].description, "clear sky")
            
            }
        }

}
