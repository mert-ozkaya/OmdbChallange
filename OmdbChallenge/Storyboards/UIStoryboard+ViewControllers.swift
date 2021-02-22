//
//  UIStoryboard+ViewControllers.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

extension UIStoryboard {
    var splashVC: SplashVC {
        guard let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: "SplashVC") as? SplashVC else {
            fatalError("SplashVC not found in Main.storyboard")
        }
        return viewController
    }
    
    var searchManagementVC: SearchManagementVC {
        guard let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: "SearchManagementVC") as? SearchManagementVC else {
            fatalError("SearchManagementVC not found in Main.storyboard")
        }
        return viewController
    }
}
