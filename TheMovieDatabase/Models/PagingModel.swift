//
//  PagingModel.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/4/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import Foundation

struct PagingModel<TResult: Codable> : Codable {
    var page: Int = 0
    var results: [TResult] = []
    var totalResults: Int = 0
    var totalPages: Int = 0
    
    enum CodingKeys: String, CodingKey {
      case page
      case total_results
      case total_pages
      case results
    }
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(page, forKey: .page)
      try container.encode(totalResults, forKey: .total_results)
      try container.encode(totalPages, forKey: .total_pages)
      try container.encode(results, forKey: .results)
    }
    
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      page = try container.decode(Int.self, forKey: .page)
      totalResults = try container.decode(Int.self, forKey: .total_results)
      totalPages = try container.decode(Int.self, forKey: .total_pages)
      results = try container.decode([TResult].self, forKey: .results)
    }
}
