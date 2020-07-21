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
    //MARK: - IBOutlets
    @IBOutlet weak var amountTextView: AmountTextView! {
        didSet {
            amountTextView.font = Fonts.medium(.small)
            amountTextView.textColor = .gray
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = Fonts.medium(.small)
            titleLabel.textColor = .gray
        }
    }
    
    func configure(sectionTitle: String, amount: Double) {
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
