//
//  SignInVCExt.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import SnapKit

extension SignInViewController {
    
    func setupView() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(signInButton)
        contentView.addSubview(continueWithoutSignInButton)
    }
    
    func setupLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.snp.edges)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.height)
        }
        signInButton.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        continueWithoutSignInButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
}
