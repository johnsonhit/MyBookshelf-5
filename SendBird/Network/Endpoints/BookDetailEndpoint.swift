//
//  BookDetailEndpoint.swift
//  SendBird
//
//  Created by Jonathan on 10/25/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

class BookDetail: Endpoint {
    var httpMethod: HttpMethod = .get
    lazy var path: String = "books/\(isbn)"

    private let isbn: String

    init(isbn: String) {
        self.isbn = isbn
    }
}
