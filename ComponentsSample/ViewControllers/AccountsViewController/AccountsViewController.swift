//
//  AccountsViewController.swift
//  ComponentsSample
//
//  Created by Parul Vats on 18/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import UIKit
import ComponentsFramework

class AccountsViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var advertisingView: AdvertisingView! {
        didSet {
            let font = Fonts.regular(.small)
            advertisingView.configure(image: UIImage(named: ""), infoButtonTitle: "LEARN MORE", infoButtonFont: font, infoUrl: "www.google.com")
        }
    }
    @IBOutlet weak var amountTextView: AmountTextView! {
        didSet {
            amountTextView.font = Fonts.medium(.xLarge)
            amountTextView.textAlignment = .center
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = Fonts.regular(.small)
            titleLabel.textColor = .gray
            titleLabel.text = "Total Balance"
        }
    }
    @IBOutlet weak var accountsTableView: UITableView! {
        didSet {
            accountsTableView.register(AccountsTableViewCell.self)
            // - Register section header/footer view
            accountsTableView.register(AccountsTableHeaderView.nib, forHeaderFooterViewReuseIdentifier: AccountsTableHeaderView.identifier)
            accountsTableView.separatorStyle = .singleLine
            accountsTableView.backgroundColor = .white
            accountsTableView.dataSource = dataSource
            accountsTableView.delegate = self
        }
    }
    //MARK: - Variables
    lazy var accountsViewModel: AccountsViewModel = {
        return AccountsViewModel()
    }()
    
    private lazy var dataSource = makeDataSource()
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    //MARK: - Private Methods
    //Initial setup
    private func setup() {
        self.setSpecificNavigationProperties()
        self.bindViewModel()
    }
    
    fileprivate func setSpecificNavigationProperties() {
        let addBarButton = UIBarButtonItem.init(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(addButtonClicked))
        self.navigationItem.rightBarButtonItem = addBarButton
    }
    
    
    //Bind view model
    private func bindViewModel() {
        accountsViewModel.reloadTableClosure = { [weak self] in
            guard let sSelf = self else {
                return
            }
            DispatchQueue.main.async {
                sSelf.update(animate: true)
            }
        }
        
        accountsViewModel.fetchStaticAccounts()
    }
    
    @objc fileprivate func addButtonClicked() {
        // do nothing
    }
    
    private func update(animate: Bool = true) {
        // getTotalAmount
        amountTextView.configure(value: accountsViewModel.totalAmount)
        var snapshot = NSDiffableDataSourceSnapshot<Section, Account>()
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems(accountsViewModel.getSectionRows(for: .currentAccounts), toSection: .currentAccounts)
        snapshot.appendItems(accountsViewModel.getSectionRows(for: .savings), toSection: .savings)
        snapshot.appendItems(accountsViewModel.getSectionRows(for: .termDeposits), toSection: .termDeposits)
        snapshot.appendItems(accountsViewModel.getSectionRows(for: .loans), toSection: .loans)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
    
}

//MARK: - UITableViewDelegate
extension AccountsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: AccountsTableHeaderView.identifier) as? AccountsTableHeaderView else {
            return nil
        }
        let type = Section.allCases[section]
        // convert to account type
        guard let accountType = AccountType(rawValue: type.rawValue) else {
            return headerView
        }
        let totalAmount = accountsViewModel.getSectionValues(for: accountType)
        headerView.configure(sectionTitle: type.title, amount: totalAmount)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        let separatorView = UIView(frame: CGRect(x: 0, y: footerView.frame.height, width: tableView.frame.width, height: 1))
        separatorView.backgroundColor = UIColor.lightGray
        footerView.addSubview(separatorView)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
}



//MARK: - Extension for datasource
private extension AccountsViewController {
    func makeDataSource() -> UITableViewDiffableDataSource<Section, Account> {
        
        return UITableViewDiffableDataSource(
            tableView: accountsTableView,
            cellProvider: {  tableView, indexPath, account in
                let cell: AccountsTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.selectionStyle = .blue
                cell.account = account
                return cell
        }
        )
    }
}

extension AccountsViewController {
    fileprivate enum Section: String, CaseIterable {
        case currentAccounts = "Current Accounts"
        case savings = "Savings"
        case termDeposits = "Term Deposits"
        case loans = "Loans"
        
        var title: String {
            switch self {
            case .currentAccounts:
                return "Current Accounts"
            case .savings:
                return "Savings Accounts"
            case .termDeposits:
                return "Term Deposits"
            case .loans:
                return "Loans"
            }
        }
    }
}
