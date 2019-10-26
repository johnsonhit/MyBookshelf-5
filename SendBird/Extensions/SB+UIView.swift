//
//  SB+UIView.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

extension UIView {
    func nibView<T>(for: T.Type) -> UIView? {
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }

    @discardableResult
    func addNibView<T>(from: T.Type) -> UIView? {
        guard let nibView = nibView(for: T.self) else{ return nil }
        addSubview(nibView)
        nibView.frame = bounds
        return nibView
    }
}
