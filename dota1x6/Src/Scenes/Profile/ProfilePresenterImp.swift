//
//  ProfilePresenterImp.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit
import Kingfisher

// swiftlint: disable all


class ProfilePresenterImp: ProfilePresenter {
    
    let view: ProfileViewController
    let router: ProfileRouterImp
    
    init(view: ProfileViewController, router: ProfileRouterImp) {
        self.view = view
        self.router = router
    }
    
    func loadUserData() {
        if let data = UserDefaults.standard.data(forKey: "combinedUserData") {
            do {
                let combinedUserData = try JSONDecoder().decode(CombinedUserData.self, from: data)
                print(data)
                updateView(with: combinedUserData)
            } catch {
                print("Ошибка при декодировании CombinedUserData: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateView(with data: CombinedUserData) {
        if let avatarUrlString = data.steamUser.avatarfull, let avatarUrl = URL(string: avatarUrlString) {
            view.avatarImageView.kf.setImage(with: avatarUrl)
        }
        view.nameLabel.text = data.steamUser.personaname
        view.ratingLabel.text = "Ваш рейтинг: \(data.userAuth.rating ?? 0)"
        view.shardsLabel.text = "\(data.userAuth.shardsAmount ?? 0)" 
    }
}


// swiftlint: enable all
