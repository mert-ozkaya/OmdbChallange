//
//  PosterTableCell.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 26.02.2021.
//

import UIKit

class PosterTableCell: UITableViewCell {

    @IBOutlet private weak var posterImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withImageUrl url: String?) {
        if let url = url {
            posterImgView.setImage(with: url)
        }
    }
}
