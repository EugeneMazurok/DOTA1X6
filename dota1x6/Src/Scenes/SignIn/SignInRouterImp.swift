//
//  SignInRouterImp.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit

class SignInRouterImp: SignInRouter {
    
    var view: SignInViewController
    
    init(view: SignInViewController) {
        self.view = view
    }
    
    func goToHome() {
        let mainVC = TabbarController()
        UIApplication.shared.windows.first?.rootViewController = mainVC
    }
}
