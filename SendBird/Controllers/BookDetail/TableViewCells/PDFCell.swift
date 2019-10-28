//
//  PDFCell.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class PDFCell: UITableViewCell {

    // MARK: - View Components
    @IBOutlet private weak var chapterLabel: UILabel!
    @IBOutlet private weak var linkButton: UIButton!

    // MARK: - Public Methods
    public func configure(pdfInformation: PDFInformation) {
        chapterLabel.text = pdfInformation.chapter
        linkButton.setTitle(pdfInformation.link, for: .normal)
    }
    
}
