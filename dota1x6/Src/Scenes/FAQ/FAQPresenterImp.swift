//
//  FAQPresenterImp.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation

class FAQPresenterImp: FAQPresenter {
    
    let view: FAQViewController
    let router: FAQRouterImp
    
    init(view: FAQViewController, router: FAQRouterImp) {
        self.view = view
        self.router = router
    }
}
