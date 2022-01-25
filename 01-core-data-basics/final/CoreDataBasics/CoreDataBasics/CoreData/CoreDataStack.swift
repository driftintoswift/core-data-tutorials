//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import CoreData

final class CoreDataStack: NSPersistentContainer {
    
    static let modelName = "Blog"
    
    static let model: NSManagedObjectModel = {
        guard let url = Bundle(for: CoreDataStack.self).url(forResource: CoreDataStack.modelName, withExtension: "momd") else {
            fatalError("URL for data model bundle could not be found.")
        }
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Managed object model could not be created.")
        }
        return managedObjectModel
    }()
    
    static let shared = CoreDataStack(
        name: CoreDataStack.modelName,
        managedObjectModel: CoreDataStack.model
    )
    
    private override init(
        name: String,
        managedObjectModel: NSManagedObjectModel
    ) {
        super.init(name: name, managedObjectModel: managedObjectModel)
        
        loadPersistentStores(completionHandler: { _, error in
            if let error = error {
                print("Error loading persistent store. \(error)")
            }
        })
    }
    
}
