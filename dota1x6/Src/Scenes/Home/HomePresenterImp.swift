//
//  HomePresenter.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

class HomePresenterImp: HomePresenter {
    
    var view: HomeViewController
    var router: HomeRouterImp
    
    init(view: HomeViewController, router: HomeRouterImp) {
        self.view = view
        self.router = router
    }
}
