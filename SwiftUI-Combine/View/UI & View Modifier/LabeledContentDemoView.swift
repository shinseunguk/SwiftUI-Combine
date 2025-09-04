//
//  LabeledContentDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import SwiftUI

struct LabeledContentDemoView: View {
    @State private var username: String = "swiftui_user"
    @State private var notificationsEnabled: Bool = true
    @State private var progress: Double = 0.65
    
    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                LabeledContent("Username") {
                    Text(username)
                        .foregroundStyle(.blue)
                }
                
                LabeledContent("Notifications") {
                    Toggle("", isOn: $notificationsEnabled)
                        .labelsHidden()
                }
            }
            
            Section(header: Text("Progress")) {
                LabeledContent("Completion") {
                    ProgressView(value: progress)
                        .frame(width: 150)
                }
            }
        }
        .navigationTitle("LabeledContent Demo")
    }
}

#Preview {
    NavigationView {
        LabeledContentDemoView()
    }
}

