//
//  BaseGrid.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

class BaseGrid: UICollectionViewController {

    let numberOfColumns: Int
    weak var screen: UIViewController?
    
    init(collectionViewLayout layout: UICollectionViewLayout, numberOfColumns: Int, screen: UIViewController) {
        self.numberOfColumns = numberOfColumns
        self.screen = screen
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        40
    }
    
    override func collectionView(_ collectionView: UICollectionView, 
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath)
        return cell
    }
}

extension BaseGrid: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
            if numberOfColumns == 1 {
                return .zero
            } else {
                return UIEdgeInsets(top: .zero, left: 15, bottom: .zero, right: 15)
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalSpacing = (CGFloat(numberOfColumns) - 1) * 15 + 30
        let width = (collectionView.frame.width - totalSpacing) / CGFloat(numberOfColumns)
        let height = width * 9 / 16
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}
