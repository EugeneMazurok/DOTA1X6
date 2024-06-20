//
//  BaseGateway.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 20.06.2024.
//

import Foundation
import RxNetworkApiClient

class BaseGateway {
    
    var apiClient: ApiClient
    
    init() {
        self.apiClient = DI.resolve()
    }
}
