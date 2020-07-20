//
//  AccountsViewModel.swift
//  ComponentsSample
//
//  Created by Parul Vats on 19/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import Foundation

class AccountsViewModel {
    
    //MARK: - Variables
     var accounts: [Account] = [] {
        didSet {
            self.reloadTableClosure?()
        }
    }
    
    var totalAmount: Double = 0.0
    
    var reloadTableClosure: (()->())?
    
    //MARK: - Public Methods
    // Create an array of test accounts to show
    
    func fetchStaticAccounts() {
        guard let path = Bundle.main.path(forResource: "Accounts", ofType: "json") else {
            return
        }

        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let results = try JSONDecoder().decode(Accounts.self, from: data)
            self.accounts = results.accounts
            totalAmount = getTotalAmount(accounts: results.accounts)
        } catch let err {
            print(err)
        }
    }
    
    func getSectionRows(for accountType: AccountType) -> [Account]{
        let accounts = self.accounts.filter({ $0.accountType.rawValue == accountType.rawValue })
        return accounts
    }
    
    func getSectionValues(for accountType: AccountType) -> Double {
        let accounts = getSectionRows(for: accountType)
        let amount = getTotalAmount(accounts: accounts)
        return amount
    }
    
    fileprivate func getTotalAmount(accounts: [Account]) -> Double {
        var totalAmount = 0.0
        
        accounts.forEach {
            totalAmount = totalAmount + $0.amount
        }
        
        return totalAmount
    }
}

