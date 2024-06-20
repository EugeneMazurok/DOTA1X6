//
//  SignInViewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit

class SignInViewController: BaseViewController {
    
    var presenter: SignInPresenterImp?
    
    lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.string.button.signInWithSteam(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = R.color.appTextBlack()?.cgColor
        button.contentEdgeInsets = UIEdgeInsets(
            top: 10,
            left: 10,
            bottom: 10,
            right: 10
        )
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    lazy var continueWithoutSignInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.string.button.doNotSignIn(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(continueWithoutSignIn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SignInConfigurator.configure(view: self)
        setupView()
    }
    
    @objc
    func signIn() {
        presenter?.signIn()
    }
   
    @objc
    func continueWithoutSignIn() {
        presenter?.continueWithoutSignIn()
    }
}
