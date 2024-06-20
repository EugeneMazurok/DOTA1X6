//
//  SignInGateway.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 20.06.2024.
//

import Foundation
import WebKit
import RxNetworkApiClient
import RxSwift

class SignInGateway {
    
    func initiateSignIn(completion: @escaping (Result<URL, Error>) -> Void) {
        let returnTo = "https://www.dota1x6.com/api/auth/steam_login"
        let realm = "https://www.dota1x6.com"
        
        let params = [
            "openid.ns": "http://specs.openid.net/auth/2.0",
            "openid.mode": "checkid_setup",
            "openid.return_to": returnTo,
            "openid.realm": realm,
            "openid.identity": "http://specs.openid.net/auth/2.0/identifier_select",
            "openid.claimed_id": "http://specs.openid.net/auth/2.0/identifier_select"
        ]
        
        let queryString = params.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        let steamLoginURLString = "https://steamcommunity.com/openid/login?\(queryString)"
        
        if let steamLoginURL = URL(string: steamLoginURLString) {
            completion(.success(steamLoginURL))
        } else {
            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
        }
    }
}
