//
//  DictionaryExtensions.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/5/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import Foundation

extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        return self[index(startIndex, offsetBy: i)]
    }
}
