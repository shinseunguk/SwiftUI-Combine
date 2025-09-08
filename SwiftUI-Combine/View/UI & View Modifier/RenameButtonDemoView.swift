//
//  RenameButtonDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct RenameButtonDemoView: View {
    @State private var itemName: String = "My Item"
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationView {
            VStack {
                TextField("Rename Item", text: $itemName)
                    .focused($isFocused) // Bind focus state to the TextField
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    RenameButton() // Add the RenameButton to the toolbar
                }
            }
            .renameAction {
                isFocused = true // When RenameButton is tapped, focus the TextField
            }
        }
    }
}


#Preview {
    RenameButtonDemoView()
}
