//
//  HeroPresenter.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 19.06.2024.
//

import Foundation
import UIKit

class HeroPresenterImp: HeroPresenter {
    
    let view: UIViewController
    let router: HeroRouterImp
    
    init(view: UIViewController, router: HeroRouterImp) {
        self.view = view
        self.router = router
    }
}
