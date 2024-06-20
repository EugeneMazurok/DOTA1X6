//
//  HomeConfigurator.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

enum HomeConfigurator {
    
    static func configure(view: HomeViewController) {
        let router = HomeRouterImp(view: view)
        let presenter = HomePresenterImp(view: view, router: router)
        view.presenter = presenter
    }
}
