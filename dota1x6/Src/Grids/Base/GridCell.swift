//
//  GridCell.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        self.backgroundColor = .gray
    }
}
