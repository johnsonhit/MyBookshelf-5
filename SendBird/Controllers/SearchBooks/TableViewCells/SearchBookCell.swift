//
//  SearchBookCell.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SearchBookCell: UITableViewCell {

    // MARK: - View Components
    @IBOutlet private weak var bookImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    // MARK: - public Methods
    public func configure(book: Book) {
        bookImageView.asyncLoadImage(from: book.image)
        titleLabel.text = book.title
        subtitleLabel.text = book.subtitle
        priceLabel.text = " \(book.price) "
    }
    
}
