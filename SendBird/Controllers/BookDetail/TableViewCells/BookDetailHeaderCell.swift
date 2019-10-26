//
//  BookDetailHeaderCell.swift
//  SendBird
//
//  Created by Jonathan on 10/25/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class BookDetailHeaderCell: UITableViewCell {

    @IBOutlet private weak var bookImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var publisherLabel: UILabel!
    @IBOutlet private weak var menuButton: UIButton!

    func configure(book: Book) {
        bookImageView.asyncLoadImage(from: book.image)
        titleLabel.text = book.title
        authorLabel.text = book.authors
        publisherLabel.text = book.publisher
    }
    
}
