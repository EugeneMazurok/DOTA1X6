import DITranquillity
import RxNetworkApiClient

class DI {
    
    private static let shared = DI()
    
    fileprivate(set) static var container = DIContainer()
    fileprivate(set) static var backgroundContainer = DIContainer()
    
    private init() {
        // No Constructor
    }

//     swiftlint:disable all
    /// Основные зависимости
    static func initDependencies(_ appDelegate: AppDelegate) {
        
        DI.container = DIContainer(parent: backgroundContainer)
        
        self.container.register { () -> ApiClientImp in
            
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 60 * 20
            config.timeoutIntervalForResource = 60 * 20
            config.waitsForConnectivity = true
            config.shouldUseExtendedBackgroundIdleMode = true
            config.urlCache?.removeAllCachedResponses()
            
            let client = ApiClientImp(urlSessionConfiguration: config, completionHandlerQueue: .main)
            client.responseHandlersQueue.append(ErrorResponseHandler())
            client.responseHandlersQueue.append(JsonResponseHandler())
            client.responseHandlersQueue.append(NSErrorResponseHandler())
          
            return client
        }
        .as(ApiClient.self)
        .lifetime(.single)
    }
    // swiftlint:enable all

    static func resolve<T>() -> T {
        self.container.resolve()
    }
    
    static func resolveBackground<T>() -> T {
        self.backgroundContainer.resolve()
    }
}
