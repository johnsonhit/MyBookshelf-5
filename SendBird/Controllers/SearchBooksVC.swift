//
//  SearchBooksVC.swift
//  SendBird
//
//  Created by Jonathan on 10/23/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SearchBooksVC: UIViewController {

    private let searchbarView = SearchbarView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
