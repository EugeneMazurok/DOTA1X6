//
//  SignInConfigurator.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

enum SignInConfigurator {
    
    static func configure(view: SignInViewController) {
        let router = SignInRouterImp(view: view)
        let presenter = SignInPresenterImp(view: view, router: router)
        view.presenter = presenter
    }
}
