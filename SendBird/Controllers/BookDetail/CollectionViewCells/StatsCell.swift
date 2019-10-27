//
//  StatsCell.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class StatsCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!

    func configure(statistic: BookStatistic) {
        titleLabel.text = statistic.title
        valueLabel.text = statistic.value
        definitionLabel.text = statistic.definition
    }

}
