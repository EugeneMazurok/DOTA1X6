import Foundation
import RxNetworkApiClient
import RxSwift

extension ExtendedApiRequest {
    
    // MARK: - SteamGateway Requests
    
    static func fetchSteamUserProfileRequest(steamApiKey: String, steamID: String) -> ExtendedApiRequest<SteamResponse> {
        extendedRequest(
            path: Config.steamApi,
            method: .get, 
            endpoint: ApiEndpoint(Config.steamEndpoint),
            query:
            ("key", steamApiKey),
            ("steamids", steamID)
        )
    }
    
    static func getUserAuth(token: String) -> ExtendedApiRequest<UserAuthResponse> {
        extendedRequest(path: Config.authPath,
                        method: .get,
                        endpoint: ApiEndpoint(Config.apiEndpoint),
                        headers: [Header("Cookie", "token=\(token)")])
    }
}
