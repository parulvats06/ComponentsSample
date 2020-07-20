//
//  CurrencyConfigurator.swift
//  ComponentsSample
//
//  Created by Parul Vats on 19/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import Foundation

enum CurrencyType: String {
    case symbol = "€"
    case isoCode = "Euro"
}

class CurrencyConfigurator {
    
    static let sharedInstance: CurrencyConfigurator = CurrencyConfigurator()
    internal var currencyType: CurrencyType
    internal var minimumFractionDigits: Int
    
    init(currencyType: CurrencyType = .symbol, minimumFractionDigits: Int = 2) {
        self.currencyType = currencyType
        self.minimumFractionDigits = minimumFractionDigits
    }
    
    func setConfiguartion(currencyType: CurrencyType = .symbol, minimumFractionDigits: Int = 2) {
        self.currencyType = currencyType
        self.minimumFractionDigits = minimumFractionDigits
    }
    
}

final class CurrencyConfig {
    static internal var shared: CurrencyConfig?

    internal let currencyType: CurrencyType
    internal let minimumFractionDigits: Int
    
    fileprivate init(currencyType: CurrencyType = .symbol, minimumFractionDigits: Int = 2) {
        self.currencyType = currencyType
        self.minimumFractionDigits = minimumFractionDigits
    }
    
    public static func setup(currencyType: CurrencyType, minimumFractionDigits: Int) {
        CurrencyConfig.shared = CurrencyConfig(currencyType: currencyType, minimumFractionDigits: minimumFractionDigits)
    }
}
