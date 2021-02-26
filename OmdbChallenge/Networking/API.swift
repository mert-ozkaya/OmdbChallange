//
//  API.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import UIKit

protocol ApiSearchProvider {
    func searchAll(withQuery text: String, page: Int, completion: @escaping(SearchResponse? ) -> ())
    func fetchMovieDetails(forImdbID imdbID: String, completion: @escaping(Movie?) -> ())
}


protocol ApiProvider: ApiSearchProvider { }

final class API: ApiProvider {

    private let alamofireClient: AlamofireClientProvider
    
    init(alamofireClient: AlamofireClientProvider = AlamofireClient()) {
        self.alamofireClient = alamofireClient
    }
    
    func searchAll(withQuery text: String, page: Int, completion: @escaping(SearchResponse?) -> Void) {
        let queries: [String: String] = [
            "apikey" : AppConfig.shared.APIKey,
            "s" : text,
            "page": String(page)
        ]
        
        alamofireClient.get(queries: queries) { (data) in
            guard let data = data,
                let response = try? JSONDecoder().decode(SearchResponse.self, from: data) else {
                #if DEBUG
                    print("searchAll() response or data is nil")
                #endif
                completion(nil)
                return
            }
            completion(response)
        }
    }
    
    func fetchMovieDetails(forImdbID imdbID: String, completion: @escaping (Movie?) -> ()) {
        let queries: [String: String] = [
            "apikey" : AppConfig.shared.APIKey,
            "i" : imdbID
        ]
        
        alamofireClient.get(queries: queries) { (data) in
            guard let data = data,
                  let response = try? JSONDecoder().decode(Movie.self, from: data) else {
                completion(nil)
                return
            }
            completion(response)
        }
    }
    
}
