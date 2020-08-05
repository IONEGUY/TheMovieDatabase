//
//  MovieDetailsViewController.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/4/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var movieDetailsTableView: UITableView!
    
    var movie: Movie?
    var movieParameters = [(key: String?, value: String?)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieParameters()
        self.movieDetailsTableView.register(cellType: MovieParamTableViewCell.self)
        self.movieDetailsTableView.dataSource = self
        self.movieDetailsTableView.tableFooterView = nil
        self.movieDetailsTableView.reloadData()
    }
    
    private func setupMovieParameters() {
        self.movieParameters.append((key: Strings.title, value: movie?.title))
        self.movieParameters.append((key: Strings.overview, value: movie?.overview))
        self.movieParameters.append((key: Strings.popularity, value: String(movie?.popularity ?? 0)))
        self.movieParameters.append((key: Strings.releaseDate, value: movie?.releaseDate))
        self.movieParameters.append((key: Strings.voteAverage, value: String(movie?.voteAverage ?? 0)))
        self.movieParameters.append((key: Strings.onlyForAdult, value: String(movie?.adult ?? true)))
        self.movieParameters.append((key: Strings.originalLanguage, value: movie?.originalLanguage))
    }
}

extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieParameters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MovieParamTableViewCell.self, for: indexPath)
        let parameter = self.movieParameters[indexPath.item]
        cell.fillData(title: parameter.key ?? String.empty,
                      paramValue: parameter.value ?? String.empty)
        return cell
    }
}
