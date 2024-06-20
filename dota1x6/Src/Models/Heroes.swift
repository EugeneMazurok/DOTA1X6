//
//  File.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

struct HeroesResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        
        case strength = "DOTA_ATTRIBUTE_STRENGTH"
        case agility = "DOTA_ATTRIBUTE_AGILITY"
        case intellect = "DOTA_ATTRIBUTE_INTELLECT"
        case all = "DOTA_ATTRIBUTE_ALL"
    }
    
    let strength: [String]
    let agility: [String]
    let intellect: [String]
    let all: [String]
}

struct HeroResponse: Decodable {
    
    let changes: [Change]
    let purpleTalents: [String: [TalentModifier]]
    let blueTalents: [String: [TalentModifier]]
    let orangeTalents: [String: [TalentModifier]]
}

struct HeroBuild {}
