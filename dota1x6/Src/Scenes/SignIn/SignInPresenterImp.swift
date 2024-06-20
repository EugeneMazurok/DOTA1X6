//
//  SignInPresenterImp.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

import Foundation
import UIKit
import WebKit
import RxSwift

// swiftlint: disable cyrillic_strings implicitly_unwrapped_optional pattern_matching

class SignInPresenterImp: NSObject, SignInPresenter {
    
    weak var view: SignInViewController?
    var router: SignInRouterImp
    private var webView: WKWebView?
    private var webViewController: UIViewController?
    private let steamGateway = SteamGateway()
    private let signInGateway = SignInGateway()
    
    init(view: SignInViewController, router: SignInRouterImp) {
        self.view = view
        self.router = router
    }
    
    func signIn() {
        signInGateway.initiateSignIn { [weak self] result in
            switch result {
            case .success(let url):
                self?.presentWebView(with: url)
                
            case .failure(let error):
                print("Ошибка: \(error.localizedDescription)")
            }
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
        
        view?.present(webViewController, animated: true, completion: {
            webView.load(URLRequest(url: url))
        })
        
        self.webViewController = webViewController
    }
}

extension SignInPresenterImp: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Страница Steam загружена успешно")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Ошибка загрузки страницы Steam: \(error.localizedDescription)")
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let response = navigationResponse.response as? HTTPURLResponse else {
            decisionHandler(.cancel)
            return
        }
        
        if let url = response.url, url.absoluteString.hasPrefix("https://www.dota1x6.com") {
            webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { [weak self] cookies in
                for cookie in cookies {
                    
                    if cookie.name == "steamLoginSecure" {
                        if let steamID = self?.extractSteamID(from: cookie.value) {
                            self?.steamGateway.fetchSteamUserProfile(steamID: steamID) { result in
                                switch result {
                                case .success(let profile):
                                    print("Профиль пользователя: \(profile)")
                                    
                                case .failure(let error):
                                    print("Ошибка получения профиля пользователя: \(error.localizedDescription)")
                                }
                            }
                        } else {
                            print("Ошибка: не удалось извлечь SteamID из cookie")
                        }
                    }
                    
                    if cookie.name == "token" {
                        UserDefaults.standard.set(cookie.value, forKey: "authToken")
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.webViewController?.dismiss(animated: true, completion: nil)
                DispatchQueue.main.async {
                    self.router.goToHome()
                }
            }
        }
        
        decisionHandler(.allow)
    }
    
    private func extractSteamID(from value: String) -> String? {
        if let range = value.range(of: "%7C%7C") {
            let steamID = value[..<range.lowerBound]
            return String(steamID)
        }
        return nil
    }
}
// swiftlint: enable cyrillic_strings implicitly_unwrapped_optional pattern_matching
