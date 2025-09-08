//
//  SectionDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct SectionDemoView: View {
    @State var expandAnimals = true
    
    var body: some View {
        List {
            // ✅ 과일 섹션
            Section(header: Text("Fruits"), footer: Text("달콤하고 맛있는 과일들")) {
                Text("🍎 Apple")
                Text("🍌 Banana")
                Text("🍊 Orange")
            }
            
            // ✅ 동물 섹션
            Section(header: Text("Animals")) {
                Text("🐶 Dog")
                Text("🐱 Cat")
                Text("🐻 Bear")
            }
            
            // ✅ 색깔 섹션
            Section("Colors") {
                Text("Red")
                Text("Blue")
                Text("Green")
            }
            .listRowBackground(Color.yellow.opacity(0.2))
            .headerProminence(.increased)
            
            Section("Tight Layout") {
                Text("Item 1")
                Text("Item 2")
            }
            .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            
            // ✅ Animals Section
            Section(header: Text("Collapsible Section")) {
                DisclosureGroup(isExpanded: $expandAnimals) {
                    VStack(alignment: .leading) {
                        Text("🐶 Dog")
                        Text("🐱 Cat")
                        Text("🐻 Bear")
                    }
                    .padding(.leading)
                } label: {
                    Text("동물 리스트")
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    SectionDemoView()
}
