//
//  HomeSearchBarExt.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

extension HomeViewController {
    
    override func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text in home screen: \(searchText)")
    }
}
