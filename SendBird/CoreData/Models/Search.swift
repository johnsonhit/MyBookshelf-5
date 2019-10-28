//
//  Query.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation
import CoreData

@objc(Search)
class Search: NSManagedObject {
    @NSManaged var query: String
    @NSManaged var date: Date

    public class func fetchRequestByDate() -> NSFetchRequest<Search> {
        let request = Search.createFetchRequest()
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        return request
    }

    private class func createFetchRequest() -> NSFetchRequest<Search> {
        return NSFetchRequest<Search>(entityName: String(describing: Search.self))
    }
}
