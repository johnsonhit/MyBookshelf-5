//
//  SB+IndexPath.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

extension IndexPath {
    static func createIndexPaths(from: Int, to: Int) -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        for index in from ... to {
            indexPaths.append(IndexPath(row: index, section: 0))
        }
        return indexPaths
    }
}
