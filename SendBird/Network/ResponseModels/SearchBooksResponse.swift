//
//  SearchBooksResponse.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

struct SearchBooksResponse: Decodable {
    var error: Int
    var total: Int
    var page: Int
    var books: [Book]

    enum CodingKeys: String, CodingKey {
        case error
        case total
        case page
        case books
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let errorString = try values.decode(String.self, forKey: .error)
        error = Int(errorString) ?? 0
        let totalString = try values.decode(String.self, forKey: .total)
        total = Int(totalString) ?? 0
        let pageString = try values.decode(String.self, forKey: .page)
        page = Int(pageString) ?? 1
        books = try values.decode([Book].self, forKey: .books)
    }
}
