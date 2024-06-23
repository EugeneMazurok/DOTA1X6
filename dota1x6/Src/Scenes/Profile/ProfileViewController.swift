//
//  ProfileViewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

// swiftlint: disable all

class ProfileViewController: BaseViewController {
    
    var presenter: ProfilePresenterImp?
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    let shardsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    let customImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.shards())
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let gradientButton1: GradientButton = {
        let button = GradientButton()
        button.setTitle("ПОПОЛНИТЬ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.gradientColors = [
            R.color.orange()?.cgColor ?? UIColor().cgColor,
            R.color.yellow()?.cgColor ?? UIColor().cgColor
        ]
        return button
    }()
    
    let gradientButton2: GradientButton = {
        let button = GradientButton()
        button.setTitle("ПРОМОКОД", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.gradientColors = [
            R.color.blue()?.cgColor ?? UIColor().cgColor,
            R.color.lightBlue()?.cgColor ?? UIColor().cgColor
        ]
        return button
    }()
    
    let gradientButton3: GradientButton = {
        let button = GradientButton()
        button.setTitle("ПОДАРИТЬ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.gradientColors = [
            R.color.orange()?.cgColor ?? UIColor().cgColor,
            R.color.yellow()?.cgColor ?? UIColor().cgColor
        ]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileConfigurator.configure(view: self)
        setupView()
        presenter?.loadUserData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.popViewController(animated: !animated)
    }
}


// swiftlint: enable all
