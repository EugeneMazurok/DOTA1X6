//
//  ProfileVCExt.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import SnapKit
import UIKit

// swiftlint: disable all

extension ProfileViewController {
    
    func setupView() {
        view.backgroundColor = R.color.appWhite()
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(customImageView)
        contentView.addSubview(shardsLabel)
        contentView.addSubview(gradientButton1)
        contentView.addSubview(gradientButton2)
        contentView.addSubview(gradientButton3)
    }
    
    func setupLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.snp.edges)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.height).priority(.low)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.width.height.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(20)
            make.top.equalTo(avatarImageView.snp.top)
            make.right.equalTo(contentView.snp.right).offset(-20)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-20)
        }
        
        customImageView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.width.height.equalTo(40) // Adjust size as needed
        }
        
        shardsLabel.snp.makeConstraints { make in
            make.left.equalTo(customImageView.snp.right).offset(8)
            make.centerY.equalTo(customImageView.snp.centerY)
            make.right.equalTo(contentView.snp.right).offset(-20)
        }
        
        gradientButton1.snp.makeConstraints { make in
            make.top.equalTo(customImageView.snp.bottom).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.height.equalTo(50)
        }
        
        gradientButton2.snp.makeConstraints { make in
            make.top.equalTo(gradientButton1.snp.bottom).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.height.equalTo(50)
        }
        
        gradientButton3.snp.makeConstraints { make in
            make.top.equalTo(gradientButton2.snp.bottom).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.height.equalTo(50)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20) // Adjust bottom spacing
        }
    }
}



// swiftlint: enable all
