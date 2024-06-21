//  SignInPresenterImp.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 17.06.2024.
//

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
    let group = DispatchGroup()
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
        
        UserDefaults.standard.set(authToken, forKey: "authToken")
        
        guard let steamID = steamID else {
            print("Ошибка: не удалось извлечь SteamID из cookie")
            decisionHandler(.cancel)
            return
        }
        
        performNetworkRequests(authToken: authToken, steamID: steamID, decisionHandler: decisionHandler)
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
    
    private func performNetworkRequests(authToken: String, steamID: String, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        let group = DispatchGroup()
        
        group.enter()
        signInGateway.isAuth()
            .subscribe(
                onSuccess: { result in
                    print("isAuth Result: \(result)")
                    group.leave()
                },
                onError: { error in
                    print("Ошибка при выполнении isAuth: \(error.localizedDescription)")
                    group.leave()
                }
            )
            .disposed(by: disposeBag)
        
        group.enter()
        steamGateway.getSteamUser(steamID: steamID)
            .subscribe(
                onSuccess: { result in
                    print("steamUser Result: \(result)")
                    group.leave()
                },
                onError: { error in
                    print("Ошибка при выполнении getSteamUser: \(error.localizedDescription)")
                    group.leave()
                }
            )
            .disposed(by: disposeBag)
        
        group.notify(queue: .main) {
            self.webViewController?.dismiss(animated: true, completion: nil)
            self.router.goToHome()
            decisionHandler(.allow)
        }
    }
}
// swiftlint: enable all
