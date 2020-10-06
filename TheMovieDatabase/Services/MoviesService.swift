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
    
    func fetchTopRatedMovies(pageIndex: Int? = nil) -> PagingModel<Movie>? {
        guard let url = createTopRatedMoviesUrl(pageIndex: pageIndex) else { return nil }
        var pagingModel: PagingModel<Movie>?
        let semaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let occurredError = error {
                self.errorHandler.handle(occurredError.localizedDescription)
            } else if let fetchedData = data {
                do {
                    pagingModel = try JSONDecoder().decode(PagingModel<Movie>.self, from: fetchedData)
                } catch let error {
                    self.errorHandler.handle(error.localizedDescription)
                }
            }
            semaphore.signal()
        }.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return pagingModel
    }
    
    private func createTopRatedMoviesUrl(pageIndex: Int?) -> URL? {
        return URL(string: "\(ApiConstants.baseApiUrl)\(ApiConstants.topRatedMoviesPath)" +
            "?api_key=\(SecretKeys.apiKey)&language=\(ApiConstants.language)&page=\(String(pageIndex ?? 1))")
    }
}
