//
//  HeroConfigurator.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 19.06.2024.
//

import Foundation

enum HeroConfigurator {
    
    static func configure(view: HeroViewController) {
        let router = HeroRouterImp(view: view)
        let presenter = HeroPresenterImp(view: view, router: router)
        view.presenter = presenter
    }
}
