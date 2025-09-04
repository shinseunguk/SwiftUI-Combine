//
//  FormAndGroupBoxDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import SwiftUI

struct FormAndGroupBoxDemoView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // 📊 요약 카드 (GroupBox)
                GroupBox(label: Label("Account Summary", systemImage: "person.crop.circle")) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("👤 Name: \(name.isEmpty ? "Unknown" : name)")
                        Text("📧 Email: \(email.isEmpty ? "Unknown" : email)")
                        Text("🔔 Notifications: \(notificationsEnabled ? "On" : "Off")")
                        Text("🌙 Dark Mode: \(darkModeEnabled ? "Enabled" : "Disabled")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 4)
                }
                .padding(.horizontal)
                
                Divider()
                
                // ⚙️ 입력 및 설정 (Form)
                Form {
                    Section(header: Text("Profile")) {
                        TextField("Name", text: $name)
                        TextField("Email", text: $email)
                    }
                    
                    Section(header: Text("Preferences")) {
                        Toggle("Enable Notifications", isOn: $notificationsEnabled)
                        Toggle("Dark Mode", isOn: $darkModeEnabled)
                    }
                }
            }
            .navigationTitle("Form + GroupBox")
        }
    }
}

#Preview {
    FormAndGroupBoxDemoView()
}
