//
//  LoadingCell.swift
//  FastFilms
//
//  Created by MacBook on 2/17/20.
//  Copyright © 2020 Андрей Олесов. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var messageLabel: UILabel!
    
    func setMessage(_ message: String) {
        self.messageLabel.text = message
    }
    
    func changeSpinnerStatus(isRunning: Bool) {
        isRunning ? spinner.startAnimating() : spinner.stopAnimating()
    }
}
