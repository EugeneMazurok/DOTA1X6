//
//  HomeVIewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    var presenter: HomePresenter?
    let label: UILabel = {
        let label = UILabel()
        label.text = "Home"
        return label
    }()
    
    var postGrid: PostGrid?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postGrid = PostGrid(screen: self)
        HomeConfigurator.configure(view: self)
        setupView()
    }
}
