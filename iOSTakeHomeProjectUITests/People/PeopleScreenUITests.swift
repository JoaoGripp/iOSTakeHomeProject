//
//  PeopleScreenUITests.swift
//  iOSTakeHomeProjectUITests
//
//  Created by Joao Gripp on 10/08/23.
//

import XCTest

final class PeopleScreenUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-networking-success":"1"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_grid_has_correct_number_of_items_when_screen_loads() {
        
        let grid = app.otherElements["peopleGrid"]
        XCTAssertTrue(grid.waitForExistence(timeout: 5), "The people lazygrid should be visible")
        
        let predicate = NSPredicate(format: "identifier CONTAINS 'item_'")
        let gridItems = grid.buttons.containing(predicate)
        XCTAssertEqual(gridItems.count, 6, "There should be 6 items on screen")
        
        XCTAssertTrue(gridItems.staticTexts["#1"].exists)
        XCTAssertTrue(gridItems.staticTexts["George Bluth"].exists)
        
        XCTAssertTrue(gridItems.staticTexts["#2"].exists)
        XCTAssertTrue(gridItems.staticTexts["Janet Weaver"].exists)
        
    }
}
