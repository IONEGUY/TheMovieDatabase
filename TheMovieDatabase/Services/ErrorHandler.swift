//
//  ErrorHandler.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/5/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import Foundation

protocol ErrorHandler {
    func handle(_ errorMessage: String);
}
