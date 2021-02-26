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
    let search: [SearchResult]?
    let totalResults: String?
    let error: String?
    let response: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case error = "Error"
        case response = "Response"
    }
}
