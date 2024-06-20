//
//  HeroViewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 19.06.2024.
//

import Foundation
import UIKit

class HeroViewController: BaseViewController {
    
    var presenter: HeroPresenterImp?
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hero"
        return label
    }()
    
    var heroId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HeroConfigurator.configure(view: self)
        label.text = "Hero \(heroId ?? 52)"
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.popViewController(animated: !animated)
    }
}
