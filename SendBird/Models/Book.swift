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
    var desc: String?
    var pdf: [String: String]?
}

extension Book {
    var statistics: [BookStatistic] {
        var bookStats: [BookStatistic] = []
        if let year = year {
            bookStats.append(BookStatistic(title: "RELEASED", value: year, definition: nil))
        }
        if let pages = pages {
            bookStats.append(BookStatistic(title: "LENGTH", value: pages, definition: "Pages"))
        }
        if let publisher = publisher {
            bookStats.append(BookStatistic(title: "PUBLISHER", value: publisher, definition: nil))
        }
        if let isbn10 = isbn10 {
            bookStats.append(BookStatistic(title: "ISBN10", value: isbn10, definition: nil))
        }
        return bookStats
    }
}

struct BookStatistic {
    var title: String
    var value: String
    var definition: String?
}
