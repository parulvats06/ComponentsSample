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
        let firstViewController = AccountsViewController()
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let secondViewController = MoreViewController()
        
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0)}
    }
}


extension LandingTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {

        return false
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

    }
    
}
