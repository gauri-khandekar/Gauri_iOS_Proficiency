//
//  Gauri_iOS_ProficiencyTests.swift
//  Gauri_iOS_ProficiencyTests
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest
@testable import Gauri_iOS_Proficiency

class Gauri_iOS_ProficiencyTests: XCTestCase {

    var countryDataModel: Country_DataModel!
       var countryViewModel: Country_ViewModel!
       
       var contryInfoViewModel: Country_InfoViewModel!
       var contryInfoDataModel: Country_InfoDataModel!

       override func setUp() {
           // Put setup code here. This method is called before the invocation of each test method in the class.
       super.setUp()
           
          countryDataModel = Country_DataModel.init(title: "Country Name", info: [Country_InfoDataModel.init(title: "Place Name", description: "Place description", imageHref: nil)])
           
           countryViewModel = Country_ViewModel.init(countrydata: countryDataModel)
       }

       override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
           super.tearDown()
       }

       func testExample() {
           // This is an example of a functional test case.
           // Use XCTAssert and related functions to verify your tests produce the correct results.
       }

       func testPerformanceExample() {
           // This is an example of a performance test case.
           self.measure {
               // Put the code you want to measure the time of here.
           }
       }
       
      func testInitializationWithModel() {
       
           XCTAssertNotNil(countryViewModel, "Contry VIew model should not be nil")
       
           XCTAssertTrue(countryViewModel.countryData?.title == countryDataModel.title, "Country View model title should be equal to country data model title" )
       
           XCTAssertTrue(countryViewModel.countryData?.info?.count == countryDataModel.info?.count, "Country Info array count should be equal to country data array count" )

       }

}
