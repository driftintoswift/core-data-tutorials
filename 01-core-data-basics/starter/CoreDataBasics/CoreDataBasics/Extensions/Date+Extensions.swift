//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import Foundation

/*
    Extension for converting date to nice looking string
 */
extension Date {
    
    func pretty() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
    
}
