//
//  MovieDetailsVC.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 25.02.2021.
//

import UIKit

class MovieDetailsVC: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var leftBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .plain, target: self, action: #selector(goBack(_:)))
        button.tintColor = .white
        return button
    }()
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.register(withCellType: PosterTableCell.self)
            tableView.register(withCellType: MovieInfoCell.self)
        }
    }
    
    private var api = API()
    private var movie: Movie?
    
    var movieDetailsNavigator: MovieDetailsNavigator!
    var imdbID: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMovieDetails()
    }
    
    func setupUI() {
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func fetchMovieDetails() {
        api.fetchMovieDetails(forImdbID: self.imdbID) { (movie) in
            self.movie = movie
            self.tableView.reloadData()
        }
    }
    
    @objc func goBack(_ sender: UIBarButtonItem) {
        self.movieDetailsNavigator.goBack()
    }
    
}

extension MovieDetailsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PosterTableCell") as? PosterTableCell else {
                fatalError("PosterTableCell not found")
            }
            cell.configure(withImageUrl: self.movie?.posterUrl)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieInfoCell") as? MovieInfoCell else {
                fatalError("MovieInfoCell not found")
            }
            if let movie = self.movie {
                cell.configure(withMovie: movie)
            }
            return cell
        }
    }
}
