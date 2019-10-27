//
//  PDFCell.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class PDFCell: UITableViewCell {

    @IBOutlet weak var chapterLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!

    func configure(pdfInformation: PDFInformation) {
        chapterLabel.text = pdfInformation.chapter
        linkButton.setTitle(pdfInformation.link, for: .normal)
    }
    
}
