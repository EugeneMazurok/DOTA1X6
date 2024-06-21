//
//  Responses.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 20.06.2024.
//

import Foundation

struct SteamResponse: Codable {
    
    let response: SteamPlayers?
}

struct SteamPlayers: Codable {
    
    let players: [SteamPlayer]?
}

struct SteamPlayer: Codable {
    
    let steamid: String?
    let communityvisibilitystate: Int?
    let profilestate: Int?
    let personaname: String?
    let commentpermission: Int?
    let profileurl: String?
    let avatar: String?
    let avatarmedium: String?
    let avatarfull: String?
    let avatarhash: String?
    let lastlogoff: Int?
    let personastate: Int?
    let realname: String?
    let primaryclanid: String?
    let timecreated: Int?
    let personastateflags: Int?
    let gameextrainfo: String?
    let gameid: String?
    let loccountrycode: String?
}

struct UserAuthResponse: Codable {
    
    let authorized: Bool?
    let playerId: Int?
    let rating: Int?
    let dotaPlusExpireDate: Int?
    let isSubscribed: Bool?
    let shardsAmount: Int?
}
