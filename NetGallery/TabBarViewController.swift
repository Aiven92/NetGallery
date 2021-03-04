//
//  TabBarViewController.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 04.03.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = BioViewController()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 1)
        
        self.viewControllers = [firstViewController]
    }

}

