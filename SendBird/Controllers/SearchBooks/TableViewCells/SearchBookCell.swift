//
//  SearchBookCell.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SearchBookCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    public func configure(book: Book) {
        bookImageView.asyncLoadImage(from: book.image)
        titleLabel.text = book.title
        subtitleLabel.text = book.subtitle
        priceLabel.text = " \(book.price) "
    }
    
}
