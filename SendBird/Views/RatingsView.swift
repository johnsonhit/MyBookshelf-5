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

    @IBOutlet weak var firstStarImageView: UIImageView!
    @IBOutlet weak var secondStarImageView: UIImageView!
    @IBOutlet weak var thirdStarImageView: UIImageView!
    @IBOutlet weak var fourthStarImageView: UIImageView!
    @IBOutlet weak var fifthStarImageView: UIImageView!

    private lazy var stars = [firstStarImageView, secondStarImageView, thirdStarImageView, fourthStarImageView, fifthStarImageView]

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

    public func configure(bookRatings: String?) {
        let ratingsFloored = Int(bookRatings ?? "") ?? 0
        fillNumberOfStars(ratingsFloored)
    }

    private func fillNumberOfStars(_ starsToFill: Int) {
        guard starsToFill <= stars.count + 1 else { return }
        for starNumber in 0 ..< starsToFill {
            stars[starNumber]?.image = UIImage(systemName: "star.fill")
        }
    }

}
