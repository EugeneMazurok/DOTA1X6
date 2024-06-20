//
//  LeaderboardViewController.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit

class LeaderboardViewController: BaseViewController {
    
    var presenter: LeaderboardPresenterImp?
    let label: UILabel = {
        let label = UILabel()
        label.text = "Leaderboard"
        return label
    }()
    
    let leaderBoardTable = LeaderboardTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // swiftlint: disable cyrillic_strings
        leaderBoardTable.data =
        [
            ["001", "Bl9d1nka MEF SOL' PO SKIDKE", "1234", "5678", "9012"],
            ["002", "Доджи или жалуйся разрабу, сучка", "2345", "6789", "0123"],
            ["003", "гений миллиардер плэйбой", "3456", "7890", "1234"]
        ]
        // swiftlint: enable cyrillic_strings
        LeaderboardConfigurator.configure(view: self)
        setupView()
    }
}
