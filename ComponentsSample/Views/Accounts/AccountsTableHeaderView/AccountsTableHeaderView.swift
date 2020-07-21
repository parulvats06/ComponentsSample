//
//  AccountsTableHeaderView.swift
//  ComponentsSample
//
//  Created by Parul Vats on 18/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import UIKit
import ComponentsFramework

class AccountsTableHeaderView: UITableViewHeaderFooterView , NibLoadableView, ReusableView {

    static let amountFontSize: CGFloat = 12.0
    static let titleFontSize: CGFloat = 12.0
    @IBOutlet weak var amountTextView: AmountTextView! {
        didSet {
            amountTextView.font = UIFont.systemFont(ofSize: AccountsTableHeaderView.amountFontSize, weight: .medium)
            amountTextView.textColor = .gray
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: AccountsTableHeaderView.titleFontSize, weight: .medium)
            titleLabel.textColor = .gray
        }
    }
    
    func configure(sectionTitle: String, amount: Double) {
        //check how to integrate credit debit
        titleLabel.text = sectionTitle
        amountTextView.configure(value: amount)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }

}
