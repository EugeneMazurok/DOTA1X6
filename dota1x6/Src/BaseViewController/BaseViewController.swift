//
//  BaseViewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = R.color.appWhite()
        return scrollView
    }()
    
    var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = R.color.appWhite()
        return contentView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    @objc
    func profileAction() {
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc
    func faqAction() {
        let faqVC = FAQViewController()
        self.navigationController?.pushViewController(faqVC, animated: true)
    }
    
    func setupNavBar(rightButton: (imageName: String, action: Selector)? = nil,
                     leftButton: (imageName: String, action: Selector)? = nil,
                     isSearchBar: Bool = true) {
        
        if let rightButton = rightButton {
            let userButton = UIBarButtonItem(image: UIImage(systemName: rightButton.imageName),
                                             style: .plain,
                                             target: self,
                                             action: rightButton.action)
            self.navigationItem.rightBarButtonItem = userButton
        }
        
        if let leftButton = leftButton {
            let faqButton = UIBarButtonItem(image: UIImage(systemName: leftButton.imageName),
                                            style: .plain,
                                            target: self,
                                            action: leftButton.action)
            self.navigationItem.leftBarButtonItem = faqButton
        }
        
        if isSearchBar {
            self.navigationItem.titleView = searchBar
        }
    }
}
