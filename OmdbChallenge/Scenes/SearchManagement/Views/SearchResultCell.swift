//
//  SearchResultCell.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = ""
        yearLabel.text = ""
    }

    func configure(withImageUrl url: String?,
                   title: String,
                   year: String) {
        if let url = url {
            posterImgView.setImage(with: url)
        }
        titleLabel.text = title
        yearLabel.text = year
    }
}


    
extension SearchResultCell {
    func configure(withSearchResult item: SearchResult) {
        configure(withImageUrl: item.posterUrl,
                  title: item.title,
                  year: item.year)
    }
}

