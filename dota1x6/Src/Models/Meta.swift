//
//  Meta.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

struct TalentMetaResponse: Codable {
    
    let heroName: String
    let talentName: String
    let pickrate: String
    let averagePlace: String
    let matchCount: Int
    let places: [String: Double]
}

struct HeroMetaResponse: Codable {
    
    let heroName: String
    let talentName: String?
    let pickrate: String
    let averagePlace: String
    let matchCount: Int
    let places: [String: Double]
}

struct MetaInfo {
    
    let heroName: String
    let heroPickrate: String
    let heroAveragePlace: String
    let heroMatchCount: Int
    let heroPlaces: [String: Double]
    let talents: [Talent]
    
    init(heroStats: [HeroMetaResponse], talentStats: [TalentMetaResponse]) {
        guard let hero = heroStats.first else {
            fatalError("Hero stats should not be empty")
        }
        
        self.heroName = hero.heroName
        self.heroPickrate = hero.pickrate
        self.heroAveragePlace = hero.averagePlace
        self.heroMatchCount = hero.matchCount
        self.heroPlaces = hero.places
        
        let heroTalents = talentStats.filter { $0.heroName == hero.heroName }
        self.talents = heroTalents.map {
            Talent(talentName: $0.talentName,
                   pickrate: $0.pickrate,
                   averagePlace: $0.averagePlace,
                   matchCount: $0.matchCount,
                   places: $0.places)
        }
    }
}
