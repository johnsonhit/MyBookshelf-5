//
//  BookDetailVC.swift
//  SendBird
//
//  Created by Jonathan on 10/25/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class BookDetailVC: UIViewController {

    private let networkManager: NetworkManager
    var book: Book

    public init(book: Book, networkManager: NetworkManager) {
        self.book = book
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getBookDetail()
    }

    private func getBookDetail() {
        networkManager.makeRequest(for: BookDetailEndpoint(isbn: book.isbn13), with: Book.self) { [weak self] (book) in
            guard let self = self else { return }
            self.book = book
        }
    }

}
