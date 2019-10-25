//
//  SB+UIImageView.swift
//  SendBird
//
//  Created by Jonathan on 10/24/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

extension UIImageView {
    func asyncLoadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
