//
//  HeroesConfigurator.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

enum HeroesConfigurator {
    
    static func configure(view: HeroesViewController) {
        let router = HeroesRouterImp(view: view)
        let presenter = HeroesPresenterImp(view: view, router: router)
        view.presenter = presenter
    }
}
