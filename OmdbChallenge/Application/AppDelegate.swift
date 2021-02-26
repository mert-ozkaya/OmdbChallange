//
//  AppDelegate.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import UIKit
import Firebase
import SVProgressHUD

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configurations
        FirebaseApp.configure()
        setupSVProgressHUD()
        
        //
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            StartingApp.shared.startInterface(window)
        }
        return true
    }
    

    func setupSVProgressHUD() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setBackgroundColor(.clear)
        SVProgressHUD.setForegroundColor(UIColor(hex: "F0B909"))
        SVProgressHUD.setRingThickness(6)
        SVProgressHUD.setFadeInAnimationDuration(0.3)
        SVProgressHUD.setFadeOutAnimationDuration(0.3)
        SVProgressHUD.setMinimumSize(CGSize(width: 50, height: 50))
        SVProgressHUD.setRingNoTextRadius(30)
        SVProgressHUD.setCornerRadius(16)
    }

}

