//
//  SearchManagementNavigator.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import UIKit

protocol SearchManagementNavigatable {
    func navigateToMovieDetails(_ id: String)
}

final class SearchManagementNavigator: SearchManagementNavigatable {

    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToMovieDetails(_ id: String) {
        let searchManagementVC = UIStoryboard.main.searchManagementVC
        navigationController.pushViewController(searchManagementVC, animated: true)
    }

}
