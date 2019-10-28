//
//  BookDetailCollectionViewCell.swift
//  SendBird
//
//  Created by Jonathan on 10/24/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class BookDetailCollectionViewCell: UICollectionViewCell {

    // MARK: - View Components
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var bookTitleLabel: UILabel!
    @IBOutlet private weak var bookSubtitleLabel: UILabel!
    @IBOutlet private weak var bookPriceLabel: UILabel!

    // MARK: - Public Methods
    public func configure(book: Book) {
        bookTitleLabel.text = book.title
        bookSubtitleLabel.text = book.subtitle
        bookPriceLabel.text = " \(book.price) "
        imageView.asyncLoadImage(from: book.image)
    }

}
