//
//  UIImageView+Extensions.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import Foundation
import SDWebImage

extension UIImageView {
    func setImage(with strURL: String) {
        let url = URL(string: strURL)
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url, completed: nil)
    }
}
