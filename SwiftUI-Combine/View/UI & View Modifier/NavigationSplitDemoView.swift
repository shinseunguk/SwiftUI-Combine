//
//  NavigationSplitDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/5/25.
//

//iPad / Mac: 사이드바 + 상세 뷰로 나뉘어 표시됨.
//iPhone: 기본적으로 NavigationStack처럼 동작 (사이드바에서 선택하면 push).

import SwiftUI

struct NavigationSplitDemoView: View {
    let fruits = ["🍎 Apple", "🍌 Banana", "🍊 Orange", "🍇 Grape"]
    let details: [String: String] = [
        "🍎 Apple": "Apples are sweet and crunchy.",
        "🍌 Banana": "Bananas are rich in potassium.",
        "🍊 Orange": "Oranges are a great source of Vitamin C.",
        "🍇 Grape": "Grapes can be eaten fresh or made into wine."
    ]
    
    @State private var selectedFruit: String? = nil

    var body: some View {
        NavigationSplitView {
            // 첫 번째 Column (사이드바)
            List(fruits, id: \.self, selection: $selectedFruit) { fruit in
                Text(fruit)
            }
            .navigationTitle("Fruits")
        } detail: {
            // 두 번째 Column (상세화면)
            if let selectedFruit, let detail = details[selectedFruit] {
                VStack(spacing: 16) {
                    Text(selectedFruit)
                        .font(.largeTitle)
                    Text(detail)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                .navigationTitle(selectedFruit)
            } else {
                Text("Select a fruit")
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    NavigationSplitDemoView()
}
