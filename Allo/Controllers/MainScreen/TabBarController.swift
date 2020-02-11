//
//  TabBarController.swift
//  Allo
//
//  Created by Артем Климкин on 11/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        let friendsVC = FriendsVC()
        friendsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        viewControllers = [homeVC, friendsVC]
    }


}
