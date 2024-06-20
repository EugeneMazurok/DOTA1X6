//
//  SteamGateway.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 20.06.2024.
//

import Foundation
import RxNetworkApiClient
import RxSwift
// swiftlint: disable cyrillic_strings pattern_matching

class SteamGateway {
    
    private let steamApiKey = "77D78E8133DC0E888B0B0EA35D3928FA" // Замените на ваш ключ Steam API
    
    func fetchSteamUserProfile(steamID: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let urlString = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v2/?key=\(steamApiKey)&steamids=\(steamID)"
        guard let url = URL(string: urlString) else {
            print("Ошибка: некорректный URL для получения профиля Steam пользователя")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let response = json["response"] as? [String: Any],
                   let players = response["players"] as? [[String: Any]],
                   let player = players.first {
                    completion(.success(player))
                } else {
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON format"])
                    completion(.failure(error))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

// swiftlint: enable cyrillic_strings pattern_matching
