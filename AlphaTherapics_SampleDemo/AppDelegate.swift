//
//  AppDelegate.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    weak var coordinator: MainCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = MainCoordinator(navigationController: UINavigationController())
        self.window?.rootViewController = UIStoryboard.splashViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

