//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import SwiftUI

@main
struct CoreDataBasicsApp: App {
    
    let viewContext = CoreDataStack.shared.viewContext
    
    var body: some Scene {
        WindowGroup {
            ArticlesView()
                .environment(
                    \.managedObjectContext,
                     viewContext
                )
        }
    }
}
