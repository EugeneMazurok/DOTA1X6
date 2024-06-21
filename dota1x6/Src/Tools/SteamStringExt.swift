//
//  SteamStringExt.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 20.06.2024.
//

import Foundation

extension String {
    
    func extractSteamID() -> String? {
        if let range = self.range(of: "%7C%7C") {
            let steamID = self[..<range.lowerBound]
            return String(steamID)
        }
        return nil
    }
}
