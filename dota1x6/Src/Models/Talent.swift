//
//  Talent.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

struct Talent {
    
    let talentName: String
    let pickrate: String
    let averagePlace: String
    let matchCount: Int
    let places: [String: Double]
}

struct TalentModifier: Codable {
    
    let modName: String
    let levels: Int
    let talent: String
    let image: String
    let description: String
}
