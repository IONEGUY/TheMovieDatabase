//
//  TopRatedMoviesViewController.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/4/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import UIKit

class TopRatedMoviesViewController: UIViewController {
    @IBOutlet weak var moviesTableView: UITableView!

    private let footerHeight: CGFloat = 70

    private var refreshControl = UIRefreshControl()
    private var loadingCell: LoadingCell?

    private var movies = [Movie]()
    private var currentPageIndex = 1
    private var totalPages = 1
    private var loadMoreEnabled = true

    private var moviesService = MoviesService()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMoviesTableView()

        let pagingModel = self.moviesService.fetchTopRatedMovies(pageIndex: self.currentPageIndex)
        fetchMoviesCompleted(responce: pagingModel)
    }

    private func setupMoviesTableView() {
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        self.moviesTableView.register(cellType: MovieTableViewCell.self)

        setupMoviesTableViewFooter()
    }

    private func setupMoviesTableViewFooter() {
        loadingCell = Bundle.main.loadNibNamed(LoadingCell.typeName,
                                               owner: self.moviesTableView, options: nil)!.first as? LoadingCell
        loadingCell?.setMessage(Strings.loadingMessage)
        self.moviesTableView.tableFooterView = loadingCell
        self.moviesTableView.sectionFooterHeight = footerHeight
        setStatusToActivityIndicator(isRunning: false)
    }

    private func setStatusToActivityIndicator(isRunning: Bool) {
        loadingCell?.changeSpinnerStatus(isRunning: isRunning)
        moviesTableView.tableFooterView?.isHidden = !isRunning;
    }

    private func setBackdroundMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.moviesTableView.bounds.width, height: self.moviesTableView.bounds.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        self.moviesTableView.backgroundView = messageLabel
    }

    private func loadMore() {
        if currentPageIndex == totalPages {
            setStatusToActivityIndicator(isRunning: false)
            return
        }

        setStatusToActivityIndicator(isRunning: true)
        let pagingModel = self.moviesService.fetchTopRatedMovies(pageIndex: self.currentPageIndex)
        fetchMoviesCompleted(responce: pagingModel)
    }

    private func fetchMoviesCompleted(responce: PagingModel<Movie>?) {
        DispatchQueue.main.async {
            self.totalPages = responce?.totalPages ?? 0
            self.loadMoreEnabled = true
            self.currentPageIndex += 1
            self.updateView(responce?.results ?? [])
        }
    }

    private func updateView(_ movies: [Movie]) {
        self.movies.append(contentsOf: movies)
        self.moviesTableView.backgroundView?.isHidden = !movies.isEmpty
        if self.movies.isEmpty {
            self.setBackdroundMessage(Strings.noResultsMessage)
        }

        self.moviesTableView.reloadData()
        self.view.layoutIfNeeded()
    }
}

extension TopRatedMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = self.movies[indexPath.row]
        let vc = MovieDetailsViewController(nibName: MovieDetailsViewController.typeName, bundle: nil)
        vc.movie = selectedMovie
        self.present(vc, animated: true, completion: nil)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        if deltaOffset <= 0 && loadMoreEnabled {
            loadMoreEnabled = false
            loadMore()
        }
    }
}

extension TopRatedMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MovieTableViewCell.self, for: indexPath)
        let movie = self.movies[indexPath.item]
        cell.fillData(MovieCellModel(title: movie.title ?? String.empty,
                                     voteAverage: movie.voteAverage ?? 0,
                                     overview: movie.overview ?? String.empty))
        return cell
    }
}
