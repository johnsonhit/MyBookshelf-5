//
//  BookDetailVC.swift
//  SendBird
//
//  Created by Jonathan on 10/25/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class BookDetailVC: UIViewController {

    // MARK: - View Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        return tableView
    }()

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
        layoutViews()
    }

    override func viewSafeAreaInsetsDidChange() {
        tableView.constraintToTopSafeArea(of: view).isActive = true
        tableView.constraintToBottomSafeArea(of: view).isActive = true
        super.viewSafeAreaInsetsDidChange()
    }

    private func getBookDetail() {
        networkManager.makeRequest(for: BookDetailEndpoint(isbn: book.isbn13), with: Book.self) { [weak self] (book) in
            guard let self = self,
                let book = book
                else { return }
            self.book = book
            self.displayBookDetails()
        }
    }

    private func displayBookDetails() {

    }

}

// MARK: - Layout Views
extension BookDetailVC {
    func layoutViews() {
        view.addSubview(tableView)
        let tableviewCons = [
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(tableviewCons)
    }
}

// MARK: - UITableViewDataSource
extension BookDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
