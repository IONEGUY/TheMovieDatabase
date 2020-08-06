//
//  AlertErrorMessageHandler.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/5/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import Foundation

class AlertErrorMessageHandler: ErrorHandler {
    func handle(_ errorMessage: String) {
        AlertDialogHelper.displayAlert(title: "Error", message: errorMessage)
    }
}
