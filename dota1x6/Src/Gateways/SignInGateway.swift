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

// swiftlint: disable all

class SignInGateway: BaseGateway {
    
    func isAuth(authToken: String) -> Single<UserAuthResponse> {
        // Выполняем запрос с заголовком Cookie, содержащим токен
        let request = ExtendedApiRequest<UserAuthResponse>.getUserAuth(token: authToken)
        return apiClient.execute(request: request)
    }
}

// swiftlint: enable all
