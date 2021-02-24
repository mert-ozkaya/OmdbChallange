//
//  SearchManagementVC.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import UIKit

final class SearchManagementVC: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.register(withCellType: SearchResultCell.self)
        }
    }
    
    private var searchResults: [SearchResult] = [SearchResult]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var searchManagementNavigator: SearchManagementNavigator!
    private let validator = ThrottledTextFieldValidator()
    private let api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        didChangeSearchQuery(textField.text ?? "")
    }
    
    private func didChangeSearchQuery(_ query: String) {
        validator.validate(query: query) { [weak self] query in
            guard let strongSelf = self,
                let query = query else { return }
            strongSelf.fetchSearchResults(forQuery: query)
        }
    }
    
    func fetchSearchResults(forQuery query: String) {
    }

}
