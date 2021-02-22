//
//  CategoryType.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 23.02.2021.
//

import Foundation

enum CategoryType: String, Codable {
    case movie
    case series
    case episode
    case other
    
    init(from decoder: Decoder) throws {
      let categoryType = try decoder.singleValueContainer().decode(String.self)
      switch categoryType {
        case "movie": self = .movie
        case "series": self = .series
        case "episode": self = .episode
         default: self = .other
      }
   }
}
