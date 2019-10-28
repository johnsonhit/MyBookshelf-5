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
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        textField.addImage(UIImage(systemName: "magnifyingglass"),
                           iconSize: 24,
                           padding: 8,
                           textfieldView: .left)
    }

    @objc private func searchButtonTapped() {
        delegate?.searchbarView(self, searchTapped: textField.text ?? "")
    }

}
