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

class SignInGateway: BaseGateway {
    
    var token: String?
    
    override init() {
        super.init()
        
        if let authToken = UserDefaults.standard.object(forKey: "authToken") as? String {
            token = authToken
        }
    }
    
    func isAuth() -> Single<UserAuthResponse> {
        
        let request = ExtendedApiRequest<UserAuthResponse>.getUserAuth(token: self.token ?? "ez")
        return apiClient.execute(request: request)
    }
}
