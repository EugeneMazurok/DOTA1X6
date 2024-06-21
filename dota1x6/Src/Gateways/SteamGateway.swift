//
//  SteamGateway.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 20.06.2024.
//

import Foundation
import RxNetworkApiClient
import RxSwift

class SteamGateway: BaseGateway {
    
    private let steamApiKey = "77D78E8133DC0E888B0B0EA35D3928FA" // Замените на ваш ключ Steam API
    
    func getSteamUser(steamID: String) -> Single<SteamResponse> {
        let request = ExtendedApiRequest<SteamResponse>.fetchSteamUserProfileRequest(
            steamApiKey: self.steamApiKey,
            steamID: steamID)
        return apiClient.execute(request: request)
    }
}
