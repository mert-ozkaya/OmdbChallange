//
//  SearchResultViewModel.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import Foundation

final class SeaarchResultViewModel {
    private var page: Int = 0
    private var isLastPage: Bool = false
    private var totalResults: Int = 0
    private var searchResults = [SearchResult]()
    
    init(response: SearchResponse) {
        self.totalResults = response.totalResults
        self.searchResults = response.search
    }
    
    func getNewPage() -> Int {
        self.page += 1
        return self.page
    }
    
    func getSearchResults() -> [SearchResult] {
        return searchResults
    }
    
    func addDataForNewPage(searchResponse: SearchResponse) {
        self.totalResults = searchResponse.totalResults
         
    }
    
}
