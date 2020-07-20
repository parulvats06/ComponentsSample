//
//  Accounts.swift
//  ComponentsSample
//
//  Created by Parul Vats on 19/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import Foundation

enum AccountType: String, Decodable, CaseIterable {
    case currentAccounts = "Current Accounts"
    case savings = "Savings"
    case termDeposits = "Term Deposits"
    case loans = "Loans"
}


struct Accounts: Decodable {
    var accounts: [Account]

    private enum CodingKeys: String, CodingKey {
        case accounts = "data"
    }
}

struct Account: Decodable, Hashable {
    var accountType: AccountType
    let title: String
    let amount: Double
    let accountNumber: String
}

