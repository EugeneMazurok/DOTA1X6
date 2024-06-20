//
//  LeaderboardPresenterImp.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

class LeaderboardPresenterImp: LeaderboardPresenter {
    
    var view: LeaderboardViewController
    var leaderboardRouter: LeaderboardRouterImp
    
    init(view: LeaderboardViewController, leaderboardRouter: LeaderboardRouterImp) {
        self.view = view
        self.leaderboardRouter = leaderboardRouter
    }
}
