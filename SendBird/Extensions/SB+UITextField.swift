//
//  SB+UITextField.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

enum TextfieldView {
    case left
    case right
}

extension UITextField {
    func addImage(_ image: UIImage?, iconSize: CGFloat, padding: CGFloat, textfieldView: TextfieldView) {
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: iconSize + padding , height: iconSize))
        let imageView = UIImageView(frame: CGRect(x: padding, y: 0, width: iconSize, height: iconSize))
        imageView.image = image
        imageContainerView.addSubview(imageView)
        switch textfieldView {
        case .left:
            leftView = imageContainerView
            leftViewMode = .always
        case .right:
            rightView = imageContainerView
            rightViewMode = .always
        }
    }
}
