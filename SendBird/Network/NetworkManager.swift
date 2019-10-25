//
//  NetworkManager.swift
//  SendBird
//
//  Created by Jonathan on 10/23/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

struct NetworkManager {

    private let baseURLString = "https://api.itbook.store/1.0/"

    public func makeRequest<T: Decodable>(for endpoint: Endpoint, with expectedResponseType: T.Type, completion: @escaping (T?) -> Void) {
        guard let request = buildRequest(for: endpoint) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil)
                    return
                }
                completion(try? JSONDecoder().decode(T.self, from: data))
            }
        }
        task.resume()
    }

    private func buildRequest(for endpoint: Endpoint) -> URLRequest? {
        guard let url = URL(string: "\(baseURLString)/\(endpoint.path)") else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        return request
    }

}
