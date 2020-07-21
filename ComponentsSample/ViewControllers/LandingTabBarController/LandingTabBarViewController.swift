//
//  LandingTabBarViewController.swift
//  ComponentsSample
//
//  Created by Parul Vats on 18/07/2020.
//  Copyright © 2020 Tekhsters. All rights reserved.
//

import UIKit

class LandingTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tabBar.barTintColor = UIColor.white
        createTabs()
        self.delegate = self
    }
    
    
    fileprivate func createTabs() {
    
        let accountsViewController = AccountsViewController()
        accountsViewController.tabBarItem = UITabBarItem(title: "Accounts", image: UIImage(systemName: "tray.full"), tag: 0)
        
        let paymentViewController = PaymentViewController()
        paymentViewController.tabBarItem = UITabBarItem(title: "Payment", image: UIImage(systemName: "creditcard.fill"), tag: 1)
        
        let insightsViewController = InsightsViewController()
        insightsViewController.tabBarItem = UITabBarItem(title: "Insights", image: UIImage(systemName: "chart.bar"), tag: 2)
        
        let cardViewController = CardViewController()
        cardViewController.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "creditcard"), tag: 3)
        
        let moreViewController = MoreViewController()
        moreViewController.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis"), tag: 4)
        let tabBarList = [accountsViewController, paymentViewController, insightsViewController, cardViewController, moreViewController]
        
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0)}
    }
}


extension LandingTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        guard tabBarController.selectedIndex != 0 else {
            return false
        }
        
        return true
    }
    
}
