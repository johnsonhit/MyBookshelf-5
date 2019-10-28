//
//  SearchBooksEndpoint.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

class SearchBooksEndpoint: Endpoint {
    var httpMethod: HttpMethod = .get
    lazy var path: String = "search/\(query)"

    private let query: String

    init(query: String) {
        self.query = query
    }
}
