//
//  HomeVCExt.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit
import SnapKit

extension HomeViewController {
    
    func setupView() {
        view.backgroundColor = R.color.appWhite()
        setupNavBar(rightButton: (imageName: "circle.fill", action: #selector(profileAction)),
                    leftButton: (imageName: "circle.fill", action: #selector(faqAction)))
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(postGrid?.view ?? UIView())
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
        postGrid?.view.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(15)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
