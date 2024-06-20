//
//  PostGrid.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

class PostGrid: BaseGrid {

    init(screen: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout, numberOfColumns: 1, screen: screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
