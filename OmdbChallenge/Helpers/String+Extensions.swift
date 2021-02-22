//
//  String+Extensions.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment:"")
    }
}
