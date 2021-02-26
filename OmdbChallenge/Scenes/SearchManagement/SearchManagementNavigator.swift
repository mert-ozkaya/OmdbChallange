//
//  SearchManagementNavigator.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//
import FirebaseAnalytics
import FirebaseCore
import UIKit

protocol SearchManagementNavigatable {
    func navigateToMovieDetails(_ searchResult: SearchResult)
}

final class SearchManagementNavigator: SearchManagementNavigatable {

    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToMovieDetails(_ searchResult: SearchResult) {
        let parameters: [String: Any] = [
            "movie_id": searchResult.imdbID,
            "movie_title": searchResult.title,
            "movie_category": searchResult.type.rawValue
        ]
        Analytics.logEvent("movie_detail_display", parameters: parameters)
        
        let movieDetailsVC = UIStoryboard.main.movieDetails
        movieDetailsVC.imdbID = searchResult.imdbID
        movieDetailsVC.movieDetailsNavigator = MovieDetailsNavigator(navigationController: self.navigationController)
        movieDetailsVC.navigationItem.titleView = UILabel.defaultNavigationTitleView(withTitle: "Details".localized)
        movieDetailsVC.view.backgroundColor = .black
        navigationController.pushViewController(movieDetailsVC, animated: true)
    }

}
