//
//  Book.swift
//  SendBird
//
//  Created by Jonathan on 10/23/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

struct Book: Codable {
    var title: String
    var subtitle: String
    var isbn13: String
    var price: String
    var image: String
    var url: String
    var authors: String?
    var publisher: String?
    var isbn10: String?
    var pages: String?
    var year: String?
    var rating: String?
    var description: String?
    var pdf: [String: String]?
}
