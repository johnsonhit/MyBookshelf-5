//
//  Constraints+UIView.swift
//  SendBird
//
//  Created by Jonathan on 10/24/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

extension UIView {
    func constraintToTopSafeArea(of view: UIView) -> NSLayoutConstraint {
        let topSafeInsets = view.safeAreaInsets.top
        let topSafeAreaConsName = "topSafeAreaCons"
        // Remove previous active constraint
        for constraint in view.constraints {
            if constraint.identifier == topSafeAreaConsName {
                constraint.isActive = false
            }
        }
        let topSafeAreaCons = topAnchor.constraint(equalTo: view.topAnchor, constant: topSafeInsets)
        topSafeAreaCons.identifier = topSafeAreaConsName
        return topSafeAreaCons
    }

    func constraintToBottomSafeArea(of view: UIView) -> NSLayoutConstraint {
        let bottomSafeInsets = view.safeAreaInsets.bottom
        let bottomSafeAreaConsName = "bottomSafeAreaCons"
        // Remove previous active constraint
        for constraint in view.constraints {
            if constraint.identifier == bottomSafeAreaConsName {
                constraint.isActive = false
            }
        }
        let bottomSafeAreaCons = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomSafeInsets)
        bottomSafeAreaCons.identifier = bottomSafeAreaConsName
        return bottomSafeAreaCons
    }
}
