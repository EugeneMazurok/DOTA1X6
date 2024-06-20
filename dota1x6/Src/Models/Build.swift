//
//  Build.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation

struct TalentBuildResponse: Decodable {
    
    let talentBuilds: [String: TalentBuild]
    let talentNames: [String]
}

struct TalentBuild: Decodable {
    
    let startItems: TalentItems
    let earlyItems: TalentItems
    let midItems: TalentItems
    let lateItems: TalentItems
}

struct TalentItems: Decodable {
    
    let items: [String]
    let hasAghanimShard: Bool
    let hasAghanimScepter: Bool
}
