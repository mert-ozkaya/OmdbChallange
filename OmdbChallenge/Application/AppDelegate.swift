//
//  AppDelegate.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configurations
        FirebaseApp.configure()

        //
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            StartingApp.shared.startInterface(window)
        }
        return true
    }
    



}

