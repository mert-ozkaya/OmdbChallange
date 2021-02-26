//
//  SearchResultViewModel.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import Foundation
import SVProgressHUD

final class SeaarchResultViewModel {
    private var page: Int = 0
    private var endOfData: Bool = false
    private var totalResults: String = "0"
    private var searchResults = [SearchResult]()
    private var isFetchingData = false
    private let api: API
    
    let searchManagementDelegate: SearchManagementDelegate
    
    init(api: API = API(), delegate: SearchManagementDelegate) {
        self.api = api
        self.searchManagementDelegate = delegate
    }
    
    func getNewPage() -> Int? {
        if !self.endOfData && !isFetchingData {
            self.page += 1
            return self.page
        } else {
            return nil
        }
    }
    
    func getSearchResults() -> [SearchResult] {
        return searchResults
    }
    
    func addDataForNewPage(searchResponse: SearchResponse) {
        self.totalResults = searchResponse.totalResults ?? "0"
        self.searchResults.append(contentsOf: searchResponse.search ?? [])
        
        if String(self.searchResults.count) == self.totalResults {
            endOfData = true
        } else {
            endOfData = false
        }
    }
    
    func removeAllSearchResults() {
        self.searchResults.removeAll()
        self.page = 0
        self.endOfData = false
    }
    
    func fetchSearchResults(forQuery query: String) {
        guard let page = getNewPage() else {
            return
        }
        isFetchingData = true
        SVProgressHUD.show()
        api.searchAll(withQuery: query, page: page) { (response) in
            guard let searchResponse = response else {
                self.isFetchingData = false
                SVProgressHUD.dismiss()
                return
            }
            self.isFetchingData = false
            SVProgressHUD.dismiss()
            self.addDataForNewPage(searchResponse: searchResponse)
            self.changedData()
        }
    }
    
    private func changedData() {
        self.searchManagementDelegate.changedData()
    }
}
