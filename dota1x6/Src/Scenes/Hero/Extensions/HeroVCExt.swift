//
//  HeroVCExt.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 19.06.2024.
//

import Foundation

extension HeroViewController {
    
    func setupView() {
        view.backgroundColor = R.color.appWhite()
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(label)
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
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
