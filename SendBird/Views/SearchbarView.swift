    //
//  Searchbar.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SearchbarView: UIView {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var searchButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        addNibView(from: SearchbarView.self)
    }

}
