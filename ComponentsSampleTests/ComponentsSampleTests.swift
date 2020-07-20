//
//  ComponentsSampleTests.swift
//  ComponentsSampleTests
//
//  Created by Parul Vats on 18/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import XCTest
@testable import ComponentsSample

class ComponentsSampleTests: XCTestCase {

    let viewModel: AccountsViewModel = AccountsViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel.fetchStaticAccounts()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelParsing() {
        XCTAssert(viewModel.accounts.count == 5, "accounts count is incorrect")
    }
    
    func testAccountData() {
        let account = viewModel.accounts[0]
        XCTAssert(account.accountNumber == "NL81TRIO0253844320", "Account number is incorrect")
        XCTAssert(account.accountType == .currentAccounts)
        XCTAssert(account.amount == -1500, "account amount is incorrect")
    }
    
    func testTotalAmount() {
        XCTAssert(viewModel.totalAmount == 162710.11, "total amount is incorrect")
    }
    
    func testTotalSections() {
        XCTAssert(viewModel.getSectionRows(for: .currentAccounts).count == 2, "numebr of sections is incorrect")
    }
    
    func testTotalAmountForSection() {
        XCTAssert(viewModel.getSectionValues(for: .currentAccounts) == -500.0, "number of sections is incorrect")
    }

}
