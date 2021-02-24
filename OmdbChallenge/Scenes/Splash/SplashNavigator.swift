//
//  SplashNavigator.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import UIKit

protocol SplashNavigatable {
    func navigateToSearcManagement()
}

final class SplashNavigator: SplashNavigatable {

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func navigateToSearcManagement() {
        let searchManagementVC = UIStoryboard.main.searchManagementVC
        searchManagementVC.searchManagementNavigator = SearchManagementNavigator(navigationController: self.navigationController)
        
        searchManagementVC.view.backgroundColor = .black
        
        searchManagementVC.navigationItem.titleView = UILabel.defaultNavigationTitleView(withTitle: "Search".localized)
        searchManagementVC.navigationItem.hidesBackButton = true
        self.navigationController.pushViewController(searchManagementVC, animated: true)
//        self.window.rootViewController = self.navigationController
//        self.window.makeKeyAndVisible()
//        navigationController.show(searchManagementVC, sender: nil)
    }

}
