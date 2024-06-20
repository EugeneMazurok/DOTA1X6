//
//  ProfileConfigurator.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation

enum ProfileConfigurator {
    
    static func configure(view: ProfileViewController) {
        let router = ProfileRouterImp(view: view)
        let presenter = ProfilePresenterImp(view: view, router: router)
        view.presenter = presenter
    }
}
