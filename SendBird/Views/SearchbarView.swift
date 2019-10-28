//
//  SearchbarView.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

protocol SearchbarViewDelegate: class {
    func searchbarView(_ view: SearchbarView, searchTapped forString: String)
}

class SearchbarView: UIView {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    weak var delegate: SearchbarViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        addNibView(from: SearchbarView.self)
        let padding = 8
        let iconSize = 24
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: iconSize + padding , height: iconSize))
        let imageView = UIImageView(frame: CGRect(x: padding, y: 0, width: iconSize, height: iconSize))
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageContainerView.addSubview(imageView)
        textField.leftView = imageContainerView
        textField.leftViewMode = .always
    }

    @objc private func searchButtonTapped() {
        delegate?.searchbarView(self, searchTapped: textField.text ?? "")
    }

}
