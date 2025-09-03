//
//  FormDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/3/25.
//

import SwiftUI

struct FormDemoView: View {
    @State private var username: String = ""
    @State private var notificationsEnabled: Bool = true
    @State private var selectedColor: String = "Blue"
    @State private var birthDate = Date()

    let colors = ["Red", "Green", "Blue", "Yellow"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    TextField("Enter your username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    DatePicker("Birthday", selection: $birthDate, displayedComponents: .date)
                }

                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)

                    Picker("Favorite Color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                }

                Section {
                    Button(action: saveSettings) {
                        Text("Save Settings")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("Form Demo")
        }
    }

    private func saveSettings() {
        print("Username: \(username)")
        print("Notifications: \(notificationsEnabled)")
        print("Favorite Color: \(selectedColor)")
        print("Birthday: \(birthDate)")
    }
}

#Preview {
    FormDemoView()
}
