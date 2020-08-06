//
//  MovieTableViewCell.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/4/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    func fillData(_ movieCellModel: MovieCellModel) {
        self.titleLabel.text = movieCellModel.title
        self.voteAverageLabel.text = String(movieCellModel.voteAverage)
        self.overviewLabel.text = movieCellModel.overview
    }
}
