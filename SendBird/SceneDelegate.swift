//
//  SceneDelegate.swift
//  SendBird
//
//  Created by Jonathan on 10/23/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [NewBooksVC(), SearchBooksVC()]
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }

}

