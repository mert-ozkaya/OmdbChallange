//
//  UITableView+Extensions.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import UIKit

extension UITableView {
    func register(withCellType cell: UITableViewCell.Type) {
        self.register(UINib(nibName: String(describing: cell), bundle: nil),
                           forCellReuseIdentifier: String(describing: cell))
    }
}
