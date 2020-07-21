//
//  AccountsTableViewCell.swift
//  ComponentsSample
//
//  Created by Parul Vats on 18/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import UIKit
import ComponentsFramework

class AccountsTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet private weak var accountTitleView: AccountTitleView!
    @IBOutlet private weak var accountTypeImage: UIImageView!
    @IBOutlet weak var amountTextView: AmountTextView!
    //MARK: - Variables
    var account: Account? {
        didSet {
            if let account = self.account {
                configureCell(account)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        separatorInset = UIEdgeInsets(top: 0, left: 56, bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureCell(_ model: Account) {
        accountTypeImage.backgroundColor = getImageColor(from: model.accountType)
        accountTitleView.configure(accountTitle: model.title, accountNumber: model.accountNumber)
        amountTextView.configure(value: model.amount)
    }
    
    private func getImageColor(from accountType: AccountType) -> UIColor {
        switch accountType {
        case .currentAccounts:
            return .green
        case .savings:
            return .yellow
        case .termDeposits:
            return .orange
        case .loans:
            return .blue
        }
    }
}
