//
//  NetworkProtocol.swift
//  SendBird
//
//  Created by Jonathan on 10/23/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    var httpMethod: HttpMethod { get }
    var path: String { get }
}
