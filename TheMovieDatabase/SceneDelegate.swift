//
//  SceneDelegate.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/4/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        initializeWindow(windowScene);
    }

    private func initializeWindow(_ windowScene: UIWindowScene) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TopRatedMoviesViewController()
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
}

