import UIKit
import DBDebugToolkit
import RxSwift
import RxNetworkApiClient

// swiftlint: disable cyrillic_strings for_where

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let disposeBag = DisposeBag()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        DBDebugToolkit.setup(with: [DBShakeTrigger()])

        DI.initDependencies(self)
        
        return true
    }
    
    // MARK: - UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, 
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
            if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
               let incomingURL = userActivity.webpageURL {
                // Обработка Universal Link
                if let components = URLComponents(url: incomingURL, resolvingAgainstBaseURL: false) {
                    if components.path == "/api/auth/steam_login" {
                        // Обработка параметров из URL
                        if let queryItems = components.queryItems {
                            for item in queryItems {
                                print("Ключ: \(item.name), Значение: \(item.value ?? "")")
                            }
                        }
                        print("Успешная аутентификация через Steam")
                        return true
                    }
                }
            }
            return false
        }
    
    // Метод для извлечения токена из URL
    private func getTokenFromURL(_ url: URL) -> String? {
        if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
           let queryItems = components.queryItems {
            for queryItem in queryItems {
                if queryItem.name == "token" {
                    return queryItem.value
                }
            }
        }
        return nil
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

extension AppDelegate {

    func openWelcomeVC(window: UIWindow) {
        self.window = window
        let signInVC = SignInViewController()
        window.rootViewController = UINavigationController(rootViewController: signInVC)
        window.makeKeyAndVisible()
    }
}

// swiftlint: enable cyrillic_strings for_where
