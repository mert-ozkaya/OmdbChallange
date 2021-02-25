//
//  MovieDetailsNavigator.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 25.02.2021.
//

import UIKit

protocol MovieDetailsNavigatable {
    func goBack()
}

final class MovieDetailsNavigator: MovieDetailsNavigatable {

    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goBack() {
        self.navigationController.popViewController(animated: true)
    }
}
