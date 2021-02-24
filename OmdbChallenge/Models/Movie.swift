//
//  Movie.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import Foundation

struct Movie: Decodable {
    let imdbID: String
    let title: String
    let year: String
    let type: CategoryType
    let runtime: String?
    let genre: String
    let plot: String
    let language: String
    let country: String
    let posterUrl: String?
    let imdbRating: String
    let released : String
    
    enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case year = "Year"
        case posterUrl = "Poster"
        case type = "Type"
        case runtime = "Runtime"
        case genre = "Genre"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case imdbRating
        case released = "Released"
    }
}


