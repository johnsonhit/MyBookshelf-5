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
        // Entire nav controller is animated under the nav bar, so the view behind it is the window's background.
        // Setting background color to white will ensure navbar background color remains white
        // https://stackoverflow.com/a/27665512
        window?.backgroundColor = UIColor.white

        let networkManager = NetworkManager()

        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.isTranslucent = false
        let newBooksNav = UINavigationController(rootViewController: NewBooksVC(networkManager: networkManager))
        let searchBooksNav = UINavigationController(rootViewController: SearchBooksVC())
        tabBarVC.viewControllers = [newBooksNav, searchBooksNav]
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }

}

