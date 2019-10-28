//
//  CoreDataManager.swift
//  SendBird
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()

    private init() {}

    public private(set) var container: NSPersistentContainer!

    public func loadStores() {
        container = NSPersistentContainer(name: "SendBird")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
    }

    public func saveChanges() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }

    public func fetchData<T>(for fetchRequest: NSFetchRequest<T>) -> [T] {
        do {
            let data = try container.viewContext.fetch(fetchRequest)
            return data
        } catch {
            print("Fetch failed")
        }
        return []
    }

}
