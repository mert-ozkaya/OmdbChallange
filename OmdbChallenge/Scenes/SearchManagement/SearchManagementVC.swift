//
//  SearchManagementVC.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import UIKit

protocol SearchManagementDelegate {
    func changedData()
}

final class SearchManagementVC: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var resultInfoLabel: UILabel!
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.register(withCellType: SearchResultCell.self)
        }
    }

    var searchManagementNavigator: SearchManagementNavigator!
    private let validator = ThrottledTextFieldValidator()
    private var searchResultViewModel: SeaarchResultViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultViewModel = SeaarchResultViewModel(delegate: self)
        setupUI()
    }
    
    func setupUI() {
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        resultInfoLabel.isHidden = true
        resultInfoLabel.text = "ResultsNotFound".localized
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            if text != "" {
                didChangeSearchQuery(text)
            }
        }
    }
    
    func didChangeSearchQuery(_ query: String) {
        validator.validate(query: query) { [weak self] query in
            guard let strongSelf = self,
                let query = query else { return }
            strongSelf.searchResultViewModel.removeAllSearchResults()
            strongSelf.searchResultViewModel.fetchSearchResults(forQuery: query)
        }
    }
}

extension SearchManagementVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultViewModel.getSearchResults().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell") as? SearchResultCell else {
            fatalError("SearchResultCell not found")
        }
        let searchResults = searchResultViewModel.getSearchResults()
        cell.configure(withSearchResult: searchResults[indexPath.row])
        return cell
    }
}

extension SearchManagementVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let searchResults = searchResultViewModel.getSearchResults()
        if searchResults.count - 6 < indexPath.row {
            searchResultViewModel.fetchSearchResults(forQuery: searchTextField.text ?? "")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchResults = searchResultViewModel.getSearchResults()
        searchManagementNavigator.navigateToMovieDetails(searchResults[indexPath.row])
    }
}

extension SearchManagementVC: SearchManagementDelegate {
    func changedData() {
        self.tableView.reloadData()
        if searchResultViewModel.getSearchResults().count > 0 {
            resultInfoLabel.isHidden = true
        } else {
            resultInfoLabel.isHidden = false
            
        }
    }
}
