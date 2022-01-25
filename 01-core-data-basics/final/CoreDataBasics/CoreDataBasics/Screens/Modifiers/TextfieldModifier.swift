//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//


import SwiftUI

// MARK: Custom View Modifier to style Textfields
struct TextfieldModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.accentColor, lineWidth: 1))
    }
}

struct TextfieldModifier_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextField("Text field", text: .constant("")) {
                
            }
            .modifier(TextfieldModifier())
            
            TextField("Text field", text: .constant("")) {

            }
            .modifier(TextfieldModifier())
            .preferredColorScheme(.dark)
        }
    }
}
