//
//  StartingApp.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import UIKit

final class StartingApp {
    
    static let shared = StartingApp()
    
    private var navigationController: UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.barTintColor = .black
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.shadowOffset = CGSize(width: 1, height: 1)
        navigationController.navigationBar.shadowColor = DesignHelper.shared.specialPurple
        navigationController.navigationBar.shadowOpacity = 1.0
        return navigationController
    }
    

    func startInterface(_ window: UIWindow) {
        let searchManagementNavController = navigationController
        let searchManagementVC = UIStoryboard.main.searchManagementVC
        searchManagementVC.view.backgroundColor = .black
        searchManagementVC.navigationItem.titleView = defaultNavigationLabel("Repositories")
        

        window.rootViewController = searchManagementNavController
        window.makeKeyAndVisible()
        searchManagementNavController.show(searchManagementVC, sender: nil)
    }
}
