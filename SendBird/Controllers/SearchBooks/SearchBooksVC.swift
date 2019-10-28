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

    private let networkManager: NetworkManager

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
        super.viewSafeAreaInsetsDidChange()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
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
    }
}

extension SearchBooksVC: SearchbarViewDelegate {
    func searchbarView(_ view: SearchbarView, searchTapped forString: String) {
        navigationController?.pushViewController(SearchResultsVC(networkManager: networkManager, searchString: forString), animated: true)
    }
}
