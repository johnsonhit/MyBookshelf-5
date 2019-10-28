//
//  SearchBooksVC.swift
//  SendBird
//
//  Created by Jonathan on 10/23/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SearchBooksVC: UIViewController {

    private lazy var searchbarView: SearchbarView = {
        let searchbarView = SearchbarView()
        searchbarView.delegate = self
        return searchbarView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        return tableView
    }()

    private let networkManager: NetworkManager

    private var previousSearches: [Search] = []

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
        title = "Search"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewSafeAreaInsetsDidChange() {
        searchbarView.constraintToTopSafeArea(of: view, constant: 16).isActive = true
        tableView.constraintToBottomSafeArea(of: view, constant: -16).isActive = true
        super.viewSafeAreaInsetsDidChange()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populatePreviousSearches()
    }

    private func saveSearchQuery(_ searchQuery: String) {
        let search = Search(context: CoreDataManager.shared.container.viewContext)
        search.query = searchQuery
        search.date = Date()
        CoreDataManager.shared.saveChanges()
    }

    private func populatePreviousSearches() {
        let request = Search.createFetchRequest()
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        previousSearches = CoreDataManager.shared.fetchData(for: request)
        tableView.reloadData()
    }

}

// MARK: - Layout Views
extension SearchBooksVC {
    func layoutViews() {
        view.addSubview(searchbarView)
        let searchbarCons = [
            searchbarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            searchbarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            searchbarView.heightAnchor.constraint(equalToConstant: 44)
        ]
        NSLayoutConstraint.activate(searchbarCons)

        view.addSubview(tableView)
        let tableViewCons = [
            tableView.topAnchor.constraint(equalTo: searchbarView.bottomAnchor, constant: 16),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(tableViewCons)
    }
}

extension SearchBooksVC: SearchbarViewDelegate {
    func searchbarView(_ view: SearchbarView, searchTapped forString: String) {
        saveSearchQuery(forString)
        navigationController?.pushViewController(SearchResultsVC(networkManager: networkManager, searchString: forString), animated: true)
    }
}

extension SearchBooksVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previousSearches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = previousSearches[indexPath.row].query
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Previous Searches"
    }
}

extension SearchBooksVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousSearch = previousSearches[indexPath.row]
        navigationController?.pushViewController(SearchResultsVC(networkManager: networkManager, searchString: previousSearch.query), animated: true)
    }
}
