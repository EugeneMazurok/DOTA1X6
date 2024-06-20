//
//  ProfilePresenterImp.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation

class ProfilePresenterImp: ProfilePresenter {
    
    let view: ProfileViewController
    let router: ProfileRouterImp
    
    init(view: ProfileViewController, router: ProfileRouterImp) {
        self.view = view
        self.router = router
    }
}
