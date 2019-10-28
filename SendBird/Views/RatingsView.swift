//
//  RatingsView.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

/// This view should have constraints of :
/// width == 152
/// height >= 24
class RatingsView: UIView {

    // MARK: - View Components
    @IBOutlet private weak var firstStarImageView: UIImageView!
    @IBOutlet private weak var secondStarImageView: UIImageView!
    @IBOutlet private weak var thirdStarImageView: UIImageView!
    @IBOutlet private weak var fourthStarImageView: UIImageView!
    @IBOutlet private weak var fifthStarImageView: UIImageView!

    // MARK: - Class Properties
    private lazy var stars = [firstStarImageView, secondStarImageView, thirdStarImageView, fourthStarImageView, fifthStarImageView]

    // MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        addNibView(from: RatingsView.self)
    }

    // MARK: - Public Methods
    public func configure(bookRatings: String?) {
        let ratingsFloored = Int(bookRatings ?? "") ?? 0
        fillNumberOfStars(ratingsFloored)
    }

    // MARK: - Private Methods
    private func fillNumberOfStars(_ starsToFill: Int) {
        guard starsToFill <= stars.count + 1 else { return }
        for starNumber in 0 ..< starsToFill {
            stars[starNumber]?.image = UIImage(systemName: "star.fill")
        }
    }

}
