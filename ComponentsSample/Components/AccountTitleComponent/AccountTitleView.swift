//
//  AccountTitleView.swift
//  ComponentsSample
//
//  Created by Parul Vats on 18/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import UIKit

@IBDesignable
class AccountTitleView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var accountTitleLabel: UILabel! {
        didSet {
            accountTitleLabel.text = ""
            accountTitleLabel.textColor = .black
        }
    }
    @IBOutlet private weak var accountNumberLabel: UILabel! {
        didSet {
            accountNumberLabel.text = ""
            accountNumberLabel.textColor = .gray
        }
    }
    
    // MARK: -  configuarble properties
    open var accountTitleAppearance: AccountTitleAppearance = AccountTitleAppearance() {
        didSet {
            setUpAppearance()
        }
    }
    
    // MARK: - init
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        commonInit()
    }
    
    private func commonInit() {
        // default settings
        setUpAppearance()
    }
    
    private func setUpAppearance() {
        accountTitleLabel.font = accountTitleAppearance.accountTitleFont
        accountNumberLabel.font = accountTitleAppearance.accountNumberFont
    }
    
    open func configure(accountTitle: String, accountNumber: String) {
        accountTitleLabel.text = accountTitle
        let formattedNumber = accountNumber.separate(every: 4, with: " ")
        accountNumberLabel.text = formattedNumber
    }

}


struct AccountTitleAppearance {
    fileprivate let accountTitleFont: UIFont
    fileprivate let accountNumberFont: UIFont
    
    private static let defaultATitleFontSize: CGFloat = 15.0
    private static let defaultANumberFontSize: CGFloat = 13.0
    
    
    init(accountTitleFont: UIFont = UIFont.systemFont(ofSize: defaultATitleFontSize, weight: .medium), accountNumberFont: UIFont = UIFont.systemFont(ofSize: defaultANumberFontSize, weight: .regular)) {
        self.accountTitleFont = accountTitleFont
        self.accountNumberFont = accountNumberFont
    }
}
