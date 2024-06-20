//
//  HeroesGrid.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

class HeroesGrid: BaseGrid {

    init(screen: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout, numberOfColumns: 3, screen: screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let heroPage = HeroViewController()
        heroPage.heroId = indexPath.item
        screen?.navigationController?.pushViewController(heroPage, animated: true)
    }
}
