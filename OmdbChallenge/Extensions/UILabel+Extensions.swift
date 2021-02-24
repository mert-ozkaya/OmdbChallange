//
//  UILabel+Extensions.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import UIKit

extension UILabel {
    class func defaultNavigationTitleView(withTitle: String,
                                          frame: CGRect = CGRect(x: UIScreen.main.bounds.maxX / 2, y: 0, width: 120, height: 40)) -> UILabel {
        let label = UILabel(frame: frame)
        label.font = Font(.installed(.AvenirBlack), size: .standard(.h3)).instance
        label.text = withTitle
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }
}
