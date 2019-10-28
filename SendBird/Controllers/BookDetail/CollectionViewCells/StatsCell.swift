//
//  StatsCell.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class StatsCell: UICollectionViewCell {

    // MARK: - View Components
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var definitionLabel: UILabel!

    // MARK: - Public Methods
    public func configure(statistic: BookStatistic) {
        titleLabel.text = statistic.title
        valueLabel.text = statistic.value
        definitionLabel.text = statistic.definition
    }

}
