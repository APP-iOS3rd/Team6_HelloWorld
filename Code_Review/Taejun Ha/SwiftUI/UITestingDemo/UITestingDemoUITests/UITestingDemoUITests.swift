//
//  UITestingDemoUITests.swift
//  UITestingDemoUITests
//
//  Created by Taejun Ha on 12/18/23.
//

import XCTest

final class UITestingDemoUITests: XCTestCase {
    // 전역 XCUIApplication 객체
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWelcome() throws {
        //(1) 첫 번째 테스트
//        // 테스트하기 위해서 내가 작성해놓은 UI에서 텍스트를 가져왔음
//        // - 화면에 Welcome!이 있는데 느낌표 없이 Welcome을 가져오면 fail이 발생하겠지 없는 text니까!!
//        let welcome = app.staticTexts["Welcome!"]
//        
//        //welcome이 있는지 확인
//        XCTAssert(welcome.exists)
        
        //(2) 두 번째 테스트
        //현재 앱에 존재하는 유일한 텍스트 뷰이기 때문에 이렇게 그냥 element로 가져와서 테스트
        let welcome = app.staticTexts.element
        XCTAssert(welcome.exists)
        //welcome의 label이 Welcome!이 맞는지 확인
        XCTAssertEqual(welcome.label, "Welcome!")
    }
    
    // MARK: - 로그인 버튼 테스트
    func testLoginButton() throws {    
        // (3) 로그인 버튼이 있는지 테스트
//        
//        let login = app.buttons["Login"]
//        
//        XCTAssert(login.exists)

        // (4) 로그인 버튼이 있는지 테스트
        // - 내가 ContentView에서 작성해놓은 식별자로 버튼에 접근해서 테스트함
        // - 식별자로 접근했으니 버튼의 label을 테스트 해줘야할 필요가 있을수도 있음
        // 오류가 발생했다면
        // - 테스트가 통과되지 못하면 버튼이 제거되었는지 확인 가능!
        // - 라벨이 의도적으로 또는 실수로 변경되었는지 확인 가능!
        let login = app.buttons["loginButton"]
        XCTAssert(login.exists)
        //버튼의 label 확인
        XCTAssertEqual(login.label, "Login")
    }

    // 로그인 폼 테스트
    func testLoginFormApperance() throws {
        // 손가락으로 탭하는 것 처럼 탭 동작을 트리거
        app.buttons["loginButton"].tap()
        let loginNavBarTitle = app.staticTexts["Login"]
        // 우리가 시뮬레이터나 기기에서 실행할 때 버튼을 tap하면 바로 form이 나타나지만 UITest할 때는 딜레이가 있을 수 있다 그래서 바로 Title을 읽을 수 없을 가능성이 있으므로
        // 아니면 API 호출 결과를 받아와야 화면에 보여주는 경우에도 이렇게 지연시간을 줘야해
        // 지연시간을 살짝 주고 title이 존재하는지 확인하는거임
        XCTAssert(loginNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    // 로그인 폼의 모든 요소에 대한 테스트
    func testLoginForm() throws {
        app.buttons["loginButton"].tap()
        
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)
        
        let username = app.textFields["Username"]
        XCTAssert(username.exists)
        
        let password = app.secureTextFields["Password"]
        XCTAssert(password.exists)
        
        let login = app.buttons["loginNow"]
        XCTAssert(login.exists)
        
        let dismiss = app.buttons["Dismiss"]
        XCTAssert(dismiss.exists)
    }
    
    func testLoginDismiss() throws {
        app.buttons["loginButton"].tap()
        
        let dismiss = app.buttons["Dismiss"]
        dismiss.tap()
        
        // LoginView에서 닫기버튼을 tap하고 ContentView로 왔으니 닫기 버튼이 없어야함 그래서 XCTAssertFalse로 없는지 확인을 해주는것
        XCTAssertFalse(dismiss.waitForExistence(timeout: 0.5))
    }
    
    // 사용자 이름테스트
    // 프로그래밍 방식으로 텍스트 필드에 텍스트를 입력
    func testUsername() throws {
        app.buttons["loginButton"].tap()
        
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("test") // textField에 입력한거임 "test"를
        
        XCTAssertNotEqual(username.value as! String, "")
    }
    
    // 비밀번호 입력 테스트
    // 텍스트 입력을 제공하는 다른 방법 - 키보드 탭 동작을 시뮬레이션
    func testPassword() throws {
        app.buttons["loginButton"].tap()
        
        app.secureTextFields.element.tap()
        app.keys["p"].tap()
        app.keys["a"].tap()
        app.keys["s"].tap()
        app.keys["s"].tap()
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertNotEqual(app.secureTextFields.element.value as! String, "")
    }
    
    // 로그인 프로세스를 테스트
    func testLogin() throws {
        app.buttons["loginButton"].tap()
        
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("test")
        
        let password = app.secureTextFields["Password"]
        password.tap()
        password.typeText("pass")
        app.keyboards.buttons["Return"].tap()
        
        let login = app.buttons["loginNow"]
        login.tap()
        
        XCTAssertFalse(login.waitForExistence(timeout: 0.5))
    }
    
    // 로그인 실패 테스트
    func testFailedLoginAlert() throws {
        app.buttons["loginButton"].tap()
        app.buttons["loginNow"].tap()
        
        XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))
        
        app.alerts.element.buttons["OK"].tap()
        XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))
    }
    
    // 반복적으로 필요한 로그인 작업을 함수화
    func login() throws {
        app.buttons["loginButton"].tap()
        
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("test")
        
        let password = app.secureTextFields["Password"]
        password.tap()
        password.typeText("pass")
        app.keyboards.buttons["Return"].tap()
        
        app.buttons["loginNow"].tap()
    }
    
    // 환영 메시지 및 로그인 버튼 라벨 테스트
    // "Welcome test!" 표시되면 테스트가 성공
    func testWelcomeAfterLogin() throws {
        XCTAssert(app.staticTexts["Welcome!"].exists)
        
        try login()
        
        XCTAssert(app.staticTexts["Welcome test!"].exists)
        XCTAssertFalse(app.staticTexts["Welcome!"].exists)
    }
    
    // 로그인 버튼의 라벨을 확인하기 위한 테스트
    func testLoginLogoutLabel() throws {
        XCTAssertEqual(app.buttons["loginButton"].label, "Login")
        try login()
        XCTAssertEqual(app.buttons["loginButton"].label, "Logout")
    }
    
    // 로그아웃 테스트
    // 로그아웃 후 ContentView(첫 화면)의 사용자 인터페이스가 제대로 업데이트 되는지 확인
    func testLogout() throws {
        try login()
        
        XCTAssert(app.staticTexts["Welcome test!"].exists)
        XCTAssertEqual(app.buttons["loginButton"].label, "Logout")
        
        app.buttons["loginButton"].tap()
        
        XCTAssert(app.staticTexts["Welcome!"].exists)
        XCTAssertEqual(app.buttons["loginButton"].label, "Login")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
