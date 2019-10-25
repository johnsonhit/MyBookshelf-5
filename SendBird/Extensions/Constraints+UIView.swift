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
        let topSafeAreaIdentifier = "topSafeAreaCons"
        removePreviousConstraint(from: view, with: topSafeAreaIdentifier)

        let topSafeInsets = view.safeAreaInsets.top
        let topSafeAreaCons = topAnchor.constraint(equalTo: view.topAnchor, constant: topSafeInsets)
        topSafeAreaCons.identifier = topSafeAreaIdentifier
        return topSafeAreaCons
    }

    func constraintToBottomSafeArea(of view: UIView) -> NSLayoutConstraint {
        let bottomSafeAreaIdentifier = "bottomSafeAreaCons"
        removePreviousConstraint(from: view, with: bottomSafeAreaIdentifier)

        let bottomSafeInsets = view.safeAreaInsets.bottom
        let bottomSafeAreaCons = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomSafeInsets)
        bottomSafeAreaCons.identifier = bottomSafeAreaIdentifier
        return bottomSafeAreaCons
    }

    private func removePreviousConstraint(from view: UIView, with identifier: String) {
        for constraint in view.constraints {
            if constraint.identifier == identifier {
                constraint.isActive = false
            }
        }
    }
}
