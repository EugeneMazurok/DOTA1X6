//
//  FAQConfigurator.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation

enum FAQConfigurator {
    static func configure(view: FAQViewController) {
        let router = FAQRouterImp(view: view)
        let presenter = FAQPresenterImp(view: view, router: router)
        view.presenter = presenter
    }
}
