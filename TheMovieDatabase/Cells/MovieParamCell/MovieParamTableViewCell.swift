//
//  MovieParamTableViewCell.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/5/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import UIKit

class MovieParamTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var paramValueLabel: UILabel!
    
    func fillData(title: String, paramValue: String) {
        self.titleLabel.text = title
        self.paramValueLabel.text = paramValue
    }
}
