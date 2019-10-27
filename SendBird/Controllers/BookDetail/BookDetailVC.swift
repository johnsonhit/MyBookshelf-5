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
        tableView.registerNib(from: BookDetailHeaderCell.self)
        tableView.registerNib(from: BookDetailStatsCell.self)
        tableView.registerNib(from: BookDetailPDFCell.self)
        // Removes empty rows
        tableView.tableFooterView = UIView()
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
        styleNavigationBar()
        getBookDetail()
        layoutViews()
    }

    override func viewSafeAreaInsetsDidChange() {
        tableView.constraintToTopSafeArea(of: view).isActive = true
        tableView.constraintToBottomSafeArea(of: view).isActive = true
        super.viewSafeAreaInsetsDidChange()
    }

    private func styleNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = book.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: book.price, style: .done, target: nil, action: nil)
    }

    private func getBookDetail() {
        networkManager.makeRequest(for: BookDetailEndpoint(isbn: book.isbn13), with: Book.self) { [weak self] (book) in
            guard let self = self,
                let book = book
                else { return }
            self.book = book
            self.tableView.reloadData()
        }
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

private enum BookDetailCell: Int, CaseIterable {
    case header = 0
    case description = 1
    case statistics = 2
    case pdfs = 3
}

// MARK: - UITableViewDataSource
extension BookDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookDetailCell.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookDetailCell = BookDetailCell(rawValue: indexPath.row)
        switch bookDetailCell {
        case .header:
            if let bookDetailHeaderCell: BookDetailHeaderCell = tableView.dequeReusableCell() {
                bookDetailHeaderCell.configure(book: book)
                return bookDetailHeaderCell
            }
        case .description:
            let cell = UITableViewCell()
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = book.desc
            return cell
        case .statistics:
            if let bookDetailStatsCell: BookDetailStatsCell = tableView.dequeReusableCell() {
                bookDetailStatsCell.configure(book: book)
                return bookDetailStatsCell
            }
        case .pdfs:
            if let bookDetailPDFCell: BookDetailPDFCell = tableView.dequeReusableCell() {
                bookDetailPDFCell.configure(pdfs: book.pdf ?? [:])
                bookDetailPDFCell.delegate = self
                return bookDetailPDFCell
            }
        case .none:
            return UITableViewCell()
        }
        // This should never reach
        return UITableViewCell()
    }
}

extension BookDetailVC: BookDetailPDFCellDelegate {
    func bookDetailPDF(_ cell: BookDetailPDFCell, didPressLink urlLink: URL) {
        UIApplication.shared.open(urlLink)
    }
}
