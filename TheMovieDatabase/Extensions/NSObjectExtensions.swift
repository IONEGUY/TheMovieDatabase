//
//  NSObjectExtensions.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/4/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import Foundation

extension NSObject {
    static var typeName: String {
        return String(describing: self)
    }
}
