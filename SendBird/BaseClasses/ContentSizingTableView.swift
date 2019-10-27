//
//  ContentSizingTableView.swift
//  SendBird
//
//  Created by Jonathan on 10/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

/// Tableview resizes to its contentSize to remove ambiguity when placing within another tableview.
/// Reference: https://stackoverflow.com/a/47557592
class ContentSizingTableView: UITableView {

    /// Just a clarification for other readers: intrinsicContentSize is a property of UIView which by default doesn’t have any intrinsic size it would just be (0,0). So this would give contentSize as its new value.
    override var intrinsicContentSize: CGSize {
        return contentSize
    }

    /// Also about invalidateIntrinsicContentSize : If your tableView needs to reload, then make sure you call invalidateIntrinsicContentSize when your table view reloads data so it re-queries for the new content size
    override func reloadData() {
        super.reloadData()
        invalidateIntrinsicContentSize()
    }

}
