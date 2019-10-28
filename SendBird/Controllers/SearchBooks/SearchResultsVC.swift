//
//  SearchResultsVC.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SearchResultsVC: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerNib(from: SearchBookCell.self)
        return tableView
    }()

    private let networkManager: NetworkManager
    private let query: String

    private var page: Int = 1
    private var books: [Book] = []

    init(networkManager: NetworkManager, searchString: String) {
        self.networkManager = networkManager
        query = searchString
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
        getSearchResults()
    }

    override func viewSafeAreaInsetsDidChange() {
        tableView.constraintToTopSafeArea(of: view).isActive = true
        tableView.constraintToBottomSafeArea(of: view).isActive = true
        super.viewSafeAreaInsetsDidChange()
    }

    private func getSearchResults() {
        let searchQuery = "\(query)/\(page)"
        networkManager.makeRequest(for: SearchBooksEndpoint(query: searchQuery), with: SearchBooksResponse.self) { [weak self] (searchResult) in
            guard let self = self else { return }
            self.books = searchResult?.books ?? []
            self.tableView.reloadData()
        }
    }

}

// MARK: - Layout Views
extension SearchResultsVC {
    func layoutViews() {
        view.addSubview(tableView)
        let tableViewCons = [
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(tableViewCons)
    }
}

// MARK: - UITableViewDatasource
extension SearchResultsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SearchBookCell = tableView.dequeReusableCell() else { return UITableViewCell() }
        cell.configure(book: books[indexPath.row])
        return cell
    }
}

extension SearchResultsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        navigationController?.pushViewController(BookDetailVC(networkManager: networkManager, book: book), animated: true)
    }
}
