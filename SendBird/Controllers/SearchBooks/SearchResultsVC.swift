//
//  SearchResultsVC.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SearchResultsVC: UIViewController {

    init(searchString: String) {
        print(searchString)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
