//
//  BookDetailStatsCell.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class BookDetailStatsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    private let statsCellString = String(describing: StatsCell.self)
    private var bookStatistics: [BookStatistic] = []
    
    func configure(book: Book) {
        configureCollectionView()
        bookStatistics = book.statistics
        collectionView.reloadData()
    }

    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: statsCellString, bundle: .main), forCellWithReuseIdentifier: statsCellString)
    }
    
}

// MARK - UICollectionViewDataSource
extension BookDetailStatsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookStatistics.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: statsCellString, for: indexPath) as? StatsCell else {
            return UICollectionViewCell()
        }
        cell.configure(statistic: bookStatistics[indexPath.row])
        return cell
    }
}

extension BookDetailStatsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
