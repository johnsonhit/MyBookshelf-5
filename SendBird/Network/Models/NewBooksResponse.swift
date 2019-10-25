//
//  NewBooksResponse.swift
//  SendBird
//
//  Created by Jonathan on 10/23/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

struct NewBooksResponse: Decodable {
    var error: Int
    var total: Int
    var books: [Book]

    enum CodingKeys: String, CodingKey {
        case error
        case total
        case books
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let errorString = try values.decode(String.self, forKey: .error)
        error = Int(errorString) ?? 0
        let totalString = try values.decode(String.self, forKey: .total)
        total = Int(totalString) ?? 0
        books = try values.decode([Book].self, forKey: .books)
    }
}
