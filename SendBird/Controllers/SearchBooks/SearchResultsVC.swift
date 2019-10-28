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

    private let noResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No Results"
        label.font = UIFont.systemFont(ofSize: 17)
        label.isHidden = true
        return label
    }()

    private let networkManager: NetworkManager
    private let query: String

    private var page: Int = 1
    private var numberOfBooks = 0
    private var books: [Book] = []
    private var endOfSearch = false {
        didSet {
            displayNoResults()
        }
    }

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
            let books = searchResult?.books ?? []
            // If search results in 0 books, we assume they have reached end of the search
            if books.isEmpty {
                self.endOfSearch = true
                return
            }
            self.addBooksToTableView(books)
        }
    }

    private func addBooksToTableView(_ books: [Book]) {
        self.books.append(contentsOf: books)
        self.tableView.insertRows(at: IndexPath.createIndexPaths(from: self.numberOfBooks, to: self.numberOfBooks + books.count - 1), with: .automatic)
        self.numberOfBooks += books.count
    }

    private func displayNoResults() {
        let noResultsFound = endOfSearch && numberOfBooks == 0
        noResultLabel.isHidden = !noResultsFound
        tableView.isHidden = noResultsFound
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

        view.addSubview(noResultLabel)
        let noResultLabelCons = [
            noResultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noResultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(noResultLabelCons)
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

// MARK: - UITableViewDelegate
extension SearchResultsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        navigationController?.pushViewController(BookDetailVC(networkManager: networkManager, book: book), animated: true)
    }

    // Adds pagination functionality
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !endOfSearch else { return }
        let endOfTableView = indexPath.row == numberOfBooks - 1
        if endOfTableView {
            page += 1
            getSearchResults()
        }
    }
}
