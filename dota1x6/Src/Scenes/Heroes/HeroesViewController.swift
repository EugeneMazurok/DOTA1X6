//
//  HeroesViewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit

class HeroesViewController: BaseViewController {
    
    var presenter: HeroesPresenter?
    let label: UILabel = {
        let label = UILabel()
        label.text = "Heroes"
        return label
    }()
    
    var heroesGrid: HeroesGrid?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroesGrid = HeroesGrid(screen: self)
        HeroesConfigurator.configure(view: self)
        setupView()
    }
}
