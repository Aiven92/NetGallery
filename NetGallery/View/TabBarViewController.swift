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
        
        let layout = UICollectionViewFlowLayout()
        let cvc = NetworkImageCollectionViewController(collectionViewLayout: layout)

        let firstViewController = UINavigationController(rootViewController: cvc)
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 0)


        let secondViewController = BioViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 1)
        
        self.viewControllers = [firstViewController, secondViewController]
    }

}

