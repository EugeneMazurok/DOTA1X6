//
//  BaseTestCase.swift
//
//  Created by Станислав Миненко on 10.01.2022.
//  Copyright © 2022 webant.com. All rights reserved.
//

import XCTest

class BaseTestCase: XCTestCase {
    
    lazy var app = XCUIApplication()
    let timeOut: TimeInterval = 5
    var springboard: XCUIApplication {
        .init(bundleIdentifier: "com.apple.springboard")
    }

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app.launch()
    }

    func uninstall() {
        let bundleDisplayName = app.label

        app.terminate()

        let icon = springboard.icons[bundleDisplayName]
        if icon.exists {
            icon.press(forDuration: 1)

            let buttonRemoveApp = springboard.buttons[R.string.uiTestsStrings.removeAppButtonTitle()]
            if buttonRemoveApp.waitForExistence(timeout: timeOut) {
                buttonRemoveApp.tap()
            } else {
                XCTFail("Button \"Remove App\" not found")
            }

            let buttonDeleteApp = springboard.alerts.buttons[R.string.uiTestsStrings.deleteAppButtonTitle()]
            if buttonDeleteApp.waitForExistence(timeout: timeOut) {
                buttonDeleteApp.tap()
            } else {
                XCTFail("Button \"Delete App\" not found")
            }

            let buttonDelete = springboard.alerts.buttons[R.string.uiTestsStrings.deleteButtonTitle()]
            if buttonDelete.waitForExistence(timeout: timeOut) {
                buttonDelete.tap()
            } else {
                XCTFail("Button \"Delete\" not found")
            }
        }
    }
    
    func dismissKeyboardIfPresent() {
        guard app.keyboards.element(boundBy: 0).exists else {
            return
        }
        
        let button = UIDevice.current.userInterfaceIdiom == .pad
        ? app.keyboards.buttons["Hide keyboard"]
        : app.toolbars.buttons[R.string.uiTestsStrings.systemDoneButtonTitle()]
        
        if button.waitForExistence(timeout: timeOut) {
            button.tap()
        }
    }
}
