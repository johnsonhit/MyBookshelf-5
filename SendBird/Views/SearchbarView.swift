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

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var searchButton: UIButton!

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

    public func overrideQuery(with query: String) {
        textField.text = query
        let _ = textField.delegate?.textFieldShouldReturn?(textField)
    }

    private func commonInit() {
        addNibView(from: SearchbarView.self)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        textField.addImage(UIImage(systemName: "magnifyingglass"),
                           iconSize: 24,
                           padding: 8,
                           textfieldView: .left)
        textField.delegate = self
    }

    @objc private func searchButtonTapped() {
        let _ = textField.delegate?.textFieldShouldReturn?(textField)
    }

}

extension SearchbarView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.searchbarView(self, searchTapped: textField.text ?? "")
        return true
    }
}
