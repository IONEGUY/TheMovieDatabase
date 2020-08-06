//
//  Movie.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/4/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var voteAverage: Float?
    var adult: Bool?
    var originalLanguage: String?
    var title: String?
    var popularity: Float?
    var overview: String?
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
      case popularity
      case overview
      case vote_average
      case release_date
      case adult
      case original_language
      case title
    }
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(voteAverage, forKey: .vote_average)
      try container.encode(adult, forKey: .adult)
      try container.encode(originalLanguage, forKey: .original_language)
      try container.encode(title, forKey: .title)
      try container.encode(popularity, forKey: .popularity)
      try container.encode(overview, forKey: .overview)
      try container.encode(releaseDate, forKey: .release_date)
    }
    
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      voteAverage = try container.decode(Float.self, forKey: .vote_average)
      adult = try container.decode(Bool.self, forKey: .adult)
      originalLanguage = try container.decode(String.self, forKey: .original_language)
      title = try container.decode(String.self, forKey: .title)
      popularity = try container.decode(Float.self, forKey: .popularity)
      overview = try container.decode(String.self, forKey: .overview)
      releaseDate = try container.decode(String.self, forKey: .release_date)
    }
}
