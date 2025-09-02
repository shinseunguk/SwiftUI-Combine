//
//  ToolbarBuilderDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/2/25.
//

import Foundation
import SwiftUI

struct ToolbarBuilderDemoView: View {
    @State private var count = 0
    
    var body: some View {
        NavigationStack {
            Text("Count: \(count)")
                .navigationTitle("Toolbar Demo")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Reset") {
                            count = 0
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add") {
                            count += 1
                        }
                    }
                    
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("-") { count -= 1 }
                        Button("+") { count += 1 }
                    }
                }
        }
    }
}

#Preview {
    ToolbarBuilderDemoView()
}
