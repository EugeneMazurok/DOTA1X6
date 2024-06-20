//
//  TabbaeViewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit

class TabbarController: UITabBarController {
    
    let heroesVC = HeroesViewController()
    let homeVC = HomeViewController()
    let leaderboardVC = LeaderboardViewController()
    
    let homeIcon = UIImage(systemName: "circle.fill")
    let photoIcon = UIImage(systemName: "circle.fill")
    let profileIcon = UIImage(systemName: "circle.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let heroesNavVC = UINavigationController(rootViewController: heroesVC)
        heroesNavVC.tabBarItem = UITabBarItem(title: nil, image: photoIcon, tag: 0)
        
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        homeNavVC.tabBarItem = UITabBarItem(title: nil, image: homeIcon, tag: 1)
        
        let leaderboardNavVC = UINavigationController(rootViewController: leaderboardVC)
        leaderboardNavVC.tabBarItem = UITabBarItem(title: nil, image: profileIcon, tag: 2)
        
        self.view.backgroundColor = R.color.appWhite()
        
        viewControllers = [heroesNavVC, homeNavVC, leaderboardNavVC]
        self.selectedIndex = 1
    }
}
