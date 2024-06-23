import Foundation
import UIKit
import WebKit
import RxSwift

// swiftlint: disable all

class SignInPresenterImp: NSObject, SignInPresenter {
    
    weak var view: SignInViewController?
    var router: SignInRouterImp
    private var webView: WKWebView?
    private var webViewController: UIViewController?
    private let steamGateway = SteamGateway()
    private let signInGateway = SignInGateway()
    let disposeBag = DisposeBag()
    
    init(view: SignInViewController, router: SignInRouterImp) {
        self.view = view
        self.router = router
    }
    
    func signIn() {
        if let url = URL(string: "".generateOpedID() ?? "") {
            presentWebView(with: url)
        } else {
            print("Ошибка: URL не валиден")
        }
    }
    
    func continueWithoutSignIn() {
        router.goToHome()
    }
    
    private func presentWebView(with url: URL) {
        let webView = WKWebView()
        webView.navigationDelegate = self
        self.webView = webView
        
        let webViewController = UIViewController()
        webViewController.view = webView
        self.webViewController = webViewController
        
        view?.present(webViewController, animated: true, completion: {
            webView.load(URLRequest(url: url))
            print("Загрузка URL: \(url.absoluteString)")
        })
    }
}

extension SignInPresenterImp: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let response = navigationResponse.response as? HTTPURLResponse else {
            decisionHandler(.cancel)
            return
        }
        
        if let url = response.url, url.absoluteString.hasPrefix("https://www.dota1x6.com") {
            webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { [weak self] cookies in
                self?.handleCookies(cookies, decisionHandler: decisionHandler)
            }
        } else {
            decisionHandler(.allow)
        }
    }
    
    private func handleCookies(_ cookies: [HTTPCookie], decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        let (authToken, steamID) = extractCookies(cookies)
        
        guard let authToken = authToken else {
            print("Ошибка: отсутствует токен")
            decisionHandler(.cancel)
            return
        }
        
        guard let steamID = steamID else {
            print("Ошибка: не удалось извлечь SteamID из cookie")
            decisionHandler(.cancel)
            return
        }
        
        performNetworkRequests(authToken: authToken, steamID: steamID, decisionHandler: decisionHandler)
    }

    private func performNetworkRequests(authToken: String, steamID: String, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        var steamPlayer: SteamPlayer?

        steamGateway.getSteamUser(steamID: steamID)
            .flatMap { [weak self] steamResponse -> Single<UserAuthResponse> in
                guard let self = self else { return .error(NSError(domain: "SignInPresenterImp", code: -1, userInfo: [NSLocalizedDescriptionKey: "Ошибка: ссылка на self утеряна"])) }
                
                guard let firstPlayer = steamResponse.response?.players?.first else {
                    return .error(NSError(domain: "SignInPresenterImp", code: -1, userInfo: [NSLocalizedDescriptionKey: "Ошибка: не удалось получить данные пользователя Steam"]))
                }
                
                steamPlayer = firstPlayer

                return self.signInGateway.isAuth(authToken: authToken)
            }
            .observeOn(MainScheduler.instance) // Ensure following code runs on main thread
            .subscribe(
                onSuccess: { [weak self] userAuthResponse in
                    guard let self = self else { return }
                    print("isAuth Result: \(userAuthResponse)")
                    
                    guard let steamPlayer = steamPlayer else {
                        print("Ошибка: данные SteamPlayer не найдены")
                        decisionHandler(.cancel)
                        return
                    }

                    let combinedUserData = CombinedUserData(userAuth: userAuthResponse, steamUser: steamPlayer)
                    self.saveCombinedUserData(combinedUserData)

                    // Check if webViewController exists and is presented
                    if let webViewController = self.webViewController, webViewController.isViewLoaded && (webViewController.view.window != nil) {
                        webViewController.dismiss(animated: true, completion: {
                            self.router.goToHome()
                            decisionHandler(.allow)
                        })
                    } else {
                        // If webViewController is already dismissed or not presented, continue
                        self.router.goToHome()
                        decisionHandler(.allow)
                    }
                },
                onError: { [weak self] error in
                    print("Ошибка при выполнении isAuth: \(error.localizedDescription)")
                    decisionHandler(.cancel)
                }
            )
            .disposed(by: disposeBag)
    }

    private func saveCombinedUserData(_ combinedUserData: CombinedUserData) {
        do {
            let encodedData = try JSONEncoder().encode(combinedUserData)
            UserDefaults.standard.set(encodedData, forKey: "combinedUserData")
        } catch {
            print("Ошибка при кодировании CombinedUserData: \(error.localizedDescription)")
        }
    }
    
    private func extractCookies(_ cookies: [HTTPCookie]) -> (authToken: String?, steamID: String?) {
        var authToken: String?
        var steamID: String?
        
        for cookie in cookies {
            if cookie.name == "token" {
                authToken = cookie.value
            }
            if cookie.name == "steamLoginSecure", let id = cookie.value.extractSteamID() {
                steamID = id
            }
        }
        return (authToken, steamID)
    }
}

// swiftlint: enable all
