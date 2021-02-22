//
//  SearchResult.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 23.02.2021.
//

import Foundation

struct SearchResult: Decodable {
    let imdbID: String
    let title: String
    let year: String
    let posterUrl: String?
    let type: CategoryType
    
    enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case year = "Year"
        case posterUrl = "Poster"
        case type = "Type"
    }
}
