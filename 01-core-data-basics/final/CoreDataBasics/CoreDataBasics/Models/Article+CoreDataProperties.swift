//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import CoreData

extension Article {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var content: String
    @NSManaged public var image: Data?
    @NSManaged public var createdAt: Date
}

extension Article: Identifiable { }
