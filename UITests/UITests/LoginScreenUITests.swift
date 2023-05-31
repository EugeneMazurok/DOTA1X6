//
//  LoginScreenTests.swift
//
//  Created by Станислав Миненко on 10.01.2022.
//  Copyright © 2022 webant.com. All rights reserved.
//

import XCTest

class LoginScreenTests: BaseTestCase {
    
    let testEmail = "stas_m@webant.ru"
    let testPassword = "123456"
    
    func openLoginScreen() {
        app.tabBars.buttons[R.string.scenes.profile()].tap()
        app.buttons[R.string.scenes.signInAccount()].tap()
    }
    
    func testEmptyFieldsSignIn() {
        openLoginScreen()
        let button = app.buttons[R.string.scenes.signInAccount()]
        if button.waitForExistence(timeout: timeOut) {
            XCTAssertFalse(button.isEnabled)
        } else {
            XCTFail(R.string.scenes.signInAccount())
        }
    }
    
    func testEmptyPasswordSignIn() {
        openLoginScreen()
        let usernameField = app.textFields[R.string.scenes.username()]
        
        if usernameField.waitForExistence(timeout: timeOut) {
            usernameField.tap()
            usernameField.clearAndEnterText(testEmail)
            dismissKeyboardIfPresent()
        } else {
            XCTFail(R.string.scenes.username())
        }
        
        let button = app.buttons[R.string.scenes.signInAccount()]
        if button.waitForExistence(timeout: timeOut) {
            XCTAssertFalse(button.isEnabled)
        }
    }
    
    func testEmptyUserNameSignIn() {
        openLoginScreen()
        let passwordField = app.secureTextFields[R.string.scenes.password()]
        
        if passwordField.waitForExistence(timeout: timeOut) {
            passwordField.tap()
            passwordField.clearAndEnterText(testPassword)
            dismissKeyboardIfPresent()
        } else {
            XCTFail(R.string.scenes.password())
        }
        
        let button = app.buttons[R.string.scenes.signInAccount()]
        if button.waitForExistence(timeout: timeOut) {
            XCTAssertFalse(button.isEnabled)
        } else {
            XCTFail(R.string.scenes.signInAccount())
        }
    }
    
    func testNonEmptyFieldsSignIn() {
        openLoginScreen()
        let usernameField = app.textFields[R.string.scenes.username()]
        let passwordField = app.secureTextFields[R.string.scenes.password()]
        
        if usernameField.waitForExistence(timeout: timeOut) {
            usernameField.tap()
            usernameField.clearAndEnterText(testEmail)
            dismissKeyboardIfPresent()
        } else {
            XCTFail(R.string.scenes.signInAccount())
        }

        if passwordField.waitForExistence(timeout: timeOut) {
            passwordField.tap()
            passwordField.clearAndEnterText(testPassword)
            dismissKeyboardIfPresent()
        } else {
            XCTFail(R.string.scenes.password())
        }
        
        let button = app.buttons[R.string.scenes.signInAccount()]
        if button.waitForExistence(timeout: timeOut) {
            XCTAssertTrue(button.isEnabled)
        } else {
            XCTFail(R.string.scenes.signInAccount())
        }
    }
}
