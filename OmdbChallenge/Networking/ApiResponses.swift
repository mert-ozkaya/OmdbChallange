//
//  ApiResponses.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import Foundation

struct MovieResponse: Decodable {
    let movie: Movie
}

struct SearchResponse: Decodable {
    let search: [SearchResult]
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
    }
}
