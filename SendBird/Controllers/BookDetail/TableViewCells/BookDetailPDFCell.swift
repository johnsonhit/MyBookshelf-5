//
//  BookDetailPDFCell.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

struct PDFInformation {
    let chapter: String
    let link: String
}

protocol BookDetailPDFCellDelegate: class {
    func bookDetailPDF(_ cell: BookDetailPDFCell, didPressLink urlLink: URL)
}

class BookDetailPDFCell: UITableViewCell {

    // MARK: - View Components
    @IBOutlet private weak var tableView: ContentSizingTableView!

    // MARK: - Class Properties
    weak var delegate: BookDetailPDFCellDelegate?

    private var indexedPDFs: [PDFInformation] = []

    // MARK: - Public Methods
    public func configure(pdfs: [String: String]) {
        configureTableview()
        for (key, value) in pdfs {
            indexedPDFs.append(PDFInformation(chapter: key, link: value))
        }
        tableView.reloadData()
    }

    // MARK: - Private Methods
    private func configureTableview() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(from: PDFCell.self)
    }
    
}

// MARK: - UITableViewDataSource
extension BookDetailPDFCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indexedPDFs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PDFCell = tableView.dequeReusableCell() else { return UITableViewCell() }
        let pdfInformation = indexedPDFs[indexPath.row]
        cell.configure(pdfInformation: pdfInformation)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BookDetailPDFCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pdfInformation = indexedPDFs[indexPath.row]
        if let pdfURL = URL(string: pdfInformation.link) {
            delegate?.bookDetailPDF(self, didPressLink: pdfURL)
        }
    }
}
