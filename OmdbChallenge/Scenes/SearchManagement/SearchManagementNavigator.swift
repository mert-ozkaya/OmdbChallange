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
        let movieDetailsVC = UIStoryboard.main.movieDetails
        movieDetailsVC.imdbID = id
        movieDetailsVC.movieDetailsNavigator = MovieDetailsNavigator(navigationController: self.navigationController)
        movieDetailsVC.navigationItem.titleView = UILabel.defaultNavigationTitleView(withTitle: "Details".localized)
        movieDetailsVC.view.backgroundColor = .black
        navigationController.pushViewController(movieDetailsVC, animated: true)
    }

}
