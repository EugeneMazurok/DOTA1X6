//
//  LeaderboardConfigurator.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

enum LeaderboardConfigurator {
    
    static func configure(view: LeaderboardViewController) {
        let router = LeaderboardRouterImp(view: view)
        let presenter = LeaderboardPresenterImp(view: view, leaderboardRouter: router)
        view.presenter = presenter
    }
}
