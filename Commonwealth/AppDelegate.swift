//
//  AppDelegate.swift
//  Commonwealth
//
//  Created by Sandi Permata on 13.03.20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var homeVc = inputDataViewController()

        homeVc = inputDataViewController(nibName: "inputDataViewController", bundle: Bundle.main)
        let navigationController = UINavigationController(rootViewController: homeVc)
        navigationController.setNavigationBarHidden(true, animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }
}

