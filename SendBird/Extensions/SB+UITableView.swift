//
//  SB+UITableView.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNib<T>(from: T.Type) {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }

    func dequeReusableCell<T>() -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T
    }
}
