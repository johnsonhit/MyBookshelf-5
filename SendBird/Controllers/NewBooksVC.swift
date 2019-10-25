//
//  NewBooksVC.swift
//  SendBird
//
//  Created by Jonathan on 10/23/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class NewBooksVC: UIViewController {

    // MARK: - View Components
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        let cellName = String(describing: BookDetailCollectionViewCell.self)
        let nib = UINib(nibName: cellName, bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: cellName)

        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()

    // MARK: - Class Properties
    private let networkManager: NetworkManager

    private let paddingBetweenCells: CGFloat = 10
    private let paddingBetweenMargins: CGFloat = 20

    private var books: [Book] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
        title = "New"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        layoutViews()
        getBooks()
    }

    override func viewSafeAreaInsetsDidChange() {
        collectionView.constraintToTopSafeArea(of: view).isActive = true
        collectionView.constraintToBottomSafeArea(of: view).isActive = true
        super.viewSafeAreaInsetsDidChange()
    }

    private func getBooks() {
        networkManager.makeRequest(for: NewBooksEndpoint(), with: NewBooksResponse.self) { [weak self] (newBooksResponse) in
            guard let self = self else { return }
            self.books = newBooksResponse?.books ?? []
        }
    }

}

// MARK: - Layout Views
private extension NewBooksVC {
    func layoutViews() {
        view.addSubview(collectionView)
        let collectionViewCons = [
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(collectionViewCons)
    }
}

// MARK: - UICollectionViewDataSource
extension NewBooksVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookDetailCollectionViewCell.self), for: indexPath) as? BookDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(book: books[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension NewBooksVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = collectionView.bounds.width
        let cellWidth = (totalWidth - paddingBetweenCells - paddingBetweenMargins) / 2.0
        // Split into two columns
        return CGSize(width: cellWidth, height: cellWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0,
                                 left: paddingBetweenMargins / 2,
                                 bottom: 0,
                                 right: paddingBetweenMargins / 2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

// MARK: - UICollectionViewDelegate
extension NewBooksVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(books[indexPath.row])
    }
}
