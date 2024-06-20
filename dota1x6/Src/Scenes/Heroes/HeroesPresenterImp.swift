//
//  HeroesPresenterImp.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

class HeroesPresenterImp: HeroesPresenter {
    
    var view: HeroesViewController
    var router: HeroesRouterImp
    
    init(view: HeroesViewController, router: HeroesRouterImp) {
        self.view = view
        self.router = router
    }
}
