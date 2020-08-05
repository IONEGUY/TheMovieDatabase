//
//  MoviesService.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/4/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import Foundation

class MoviesService {
    private var errorHandler = AlertErrorMessageHandler()
    
    func fetchTopRatedMovies(pageIndex: Int? = nil, completion: @escaping (PagingModel<Movie>?)->()) {
        let url = createTopRatedMoviesUrl(pageIndex: pageIndex)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let occurredError = error {
                self.errorHandler.handle(occurredError.localizedDescription)
                completion(nil)
            }
            if let fetchedData = data {
                do {
                    let pagingModel = try JSONDecoder().decode(PagingModel<Movie>.self, from: fetchedData)
                    completion(pagingModel)
                } catch let error {
                    self.errorHandler.handle(error.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    private func createTopRatedMoviesUrl(pageIndex: Int?) -> URL {
        return URL(string: "\(ApiConstants.baseApiUrl)\(ApiConstants.topRatedMoviesPath)" +
            "?api_key=\(SecretKeys.apiKey)&language=\(ApiConstants.language)&page=\(String(pageIndex ?? 1))")!
    }
}
