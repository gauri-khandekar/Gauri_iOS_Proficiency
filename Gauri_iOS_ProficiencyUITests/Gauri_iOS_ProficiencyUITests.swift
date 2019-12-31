//
//  Gauri_iOS_ProficiencyUITests.swift
//  Gauri_iOS_ProficiencyUITests
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest

class Gauri_iOS_ProficiencyUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
       
        app = XCUIApplication()
    
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUI() {
        
        app.launch()
        
        let countryTableView = app.tables["table--countryInfoTableView"]
        
        XCTAssertTrue(countryTableView.exists, "The country tableview exists")
        let tableCells = countryTableView.cells
        
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            let promise = expectation(description: "Wait for table cells")
            
            for counter in stride(from: 0, to: count, by: 1) {
                // Take the first cell and verify that it exists
                let tableCell = tableCells.element(boundBy: counter)
                
                XCTAssertTrue(tableCell.exists, "The \(counter) cell is in place on the table")
                
                if counter == (count - 1) {
                    
                    let app = XCUIApplication()
                    let verticalScrollBar1PageScrollView = app/*@START_MENU_TOKEN@*/.scrollViews/*[[".windows[\"SBCoverSheetWindow\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.scrollViews.containing(.other, identifier:"Vertical scroll bar, 1 page").element
                    verticalScrollBar1PageScrollView/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                    verticalScrollBar1PageScrollView.tap()
                    app.children(matching: .window).element(boundBy: 2).children(matching: .other).element.swipeUp()
                    app.otherElements.statusBars.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).tap()
                    promise.fulfill()
                }
            }
            waitForExpectations(timeout: 40, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
