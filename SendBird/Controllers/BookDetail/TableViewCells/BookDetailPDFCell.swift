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

class BookDetailPDFCell: UITableViewCell {

    @IBOutlet private weak var tableView: ContentSizingTableView!

    private var indexedPDFs: [PDFInformation] = []
    
    public func configure(pdfs: [String: String]) {
        configureTableview()
        for (key, value) in pdfs {
            indexedPDFs.append(PDFInformation(chapter: key, link: value))
        }
        tableView.reloadData()
    }

    private func configureTableview() {
        tableView.dataSource = self
        tableView.registerNib(from: PDFCell.self)
    }
    
}

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
