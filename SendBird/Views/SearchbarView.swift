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

    // MARK: - View Components
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var cancelButton: UIButton!

    // MARK: - Class Properties
    weak var delegate: SearchbarViewDelegate?

    // MARK: - Lifecycle Methods
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
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        textField.addImage(UIImage(systemName: "magnifyingglass"),
                           iconSize: 24,
                           padding: 8,
                           textfieldView: .left)
        textField.delegate = self
    }

    // MARK: - Public Methods
    public func overrideQuery(with query: String) {
        textField.text = query
        let _ = textField.delegate?.textFieldShouldReturn?(textField)
    }

    // MARK: - Private Methods
    @objc private func cancelButtonTapped() {
        textField.text = ""
        textField.resignFirstResponder()
    }

}

// MARK: - UITextFieldDelegate
extension SearchbarView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.searchbarView(self, searchTapped: textField.text ?? "")
        return true
    }
}
