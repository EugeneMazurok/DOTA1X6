//
//  ProfileViewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

class ProfileViewController: BaseViewController {
    
    var presenter: ProfilePresenterImp?
    let label: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileConfigurator.configure(view: self)
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.popViewController(animated: !animated)
    }
}
