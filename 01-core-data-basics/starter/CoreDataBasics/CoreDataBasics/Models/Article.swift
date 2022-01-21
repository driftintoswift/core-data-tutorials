//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import Foundation

struct Article: Identifiable {
    
    var id: UUID = UUID()
    var title: String
    var content: String
    var imageUrl: String?
    var createdAt: Date
    
}
