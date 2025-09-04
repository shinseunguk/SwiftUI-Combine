//
//  ListDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import SwiftUI

enum ContentType: String, CaseIterable, Identifiable {
    case sidebar, grouped, insetGrouped, automatic, inset, plain
    var id: Self { self }
    
    var title: String {
        switch self {
        case .sidebar: return "Sidebar"
        case .grouped: return "Grouped"
        case .insetGrouped: return "InsetGrouped"
        case .automatic: return "Automatic"
        case .inset: return "Inset"
        case .plain: return "Plain"
        }
    }
}

extension View {
    @ViewBuilder
    func applyListStyle(_ type: ContentType) -> some View {
        switch type {
        case .sidebar: self.listStyle(.sidebar)
        case .grouped: self.listStyle(.grouped)
        case .insetGrouped: self.listStyle(.insetGrouped)
        case .automatic: self.listStyle(.automatic)
        case .inset: self.listStyle(.inset)
        case .plain: self.listStyle(.plain)
        }
    }
}

struct ListDemoView: View {
    @State var fruits = ["🍎 Apple", "🍌 Banana", "🍇 Grape", "🍊 Orange"]
    @State private var listStyle: ContentType = .plain

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("List Style", selection: $listStyle) {
                        ForEach(ContentType.allCases) { style in
                            Text(style.title).tag(style)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Fruits") {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                    }
                    .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
                    .onDelete { fruits.remove(atOffsets: $0) }
                }

                Section("Settings") {
                    NavigationLink("Profile", destination: Text("👤 Profile Screen"))
                    NavigationLink("Notifications", destination: Text("🔔 Notifications Screen"))
                }
            }
            .navigationTitle("List Demo")
            .applyListStyle(listStyle)     // ✅ 구체 스타일로 적용
            .animation(.default, value: listStyle)
            .refreshable {
                fruits = ["🍎 Apple", "🍌 Banana", "🍇 Grape", "🍊 Orange"]
            }
        }
    }
}

#Preview {
    ListDemoView()
}
