//
//  MovieInfoCell.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 26.02.2021.
//

import UIKit

class MovieInfoCell: UITableViewCell {

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var plotDetailsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        plotLabel.text = ""
        configure(title: "", genre: "", rating: "", language: "", year: "", country: "", plot: "")
    }
    
    func configure(title: String,
                   genre: String?,
                   rating: String,
                   language: String,
                   year: String,
                   country: String,
                   plot: String) {
        titleLabel.text = (title == "N/A") ? "" : title
        genreLabel.text = (genre == "N/A") ? "" : genre
        ratingLabel.text = (rating == "N/A") ? "" : rating
        languageLabel.text = (language == "N/A") ? "" : language
        yearLabel.text = (year == "N/A") ? "" : year
        countryLabel.text = (country == "N/A") ? "" : country
        plotLabel.text = (plot == "N/A") ? "" : "Plot".localized
        plotDetailsLabel.text = (plot == "N/A") ? "" : plot
    }
    
}


extension MovieInfoCell {
    func configure(withMovie item: Movie) {
        configure(title: item.title,
                  genre: item.genre,
                  rating: item.imdbRating,
                  language: item.language,
                  year: item.year,
                  country: item.country,
                  plot: item.plot)
    }
}
