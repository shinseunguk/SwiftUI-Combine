//
//  MenuDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import SwiftUI

struct MenuDemoView: View {
    @State private var selected = "선택 없음"
    
    var body: some View {
        VStack(spacing: 20) {
            
            // 기본 메뉴
            Menu("🍔 메뉴 열기") {
                Button("🍎 Apple") { selected = "Apple" }
                Button("🍌 Banana") { selected = "Banana" }
                Button("🍇 Grape") { selected = "Grape" }
            }
            
            // Label을 활용한 메뉴
            Menu {
                Button("🔄 새로고침") { selected = "Refresh" }
                Button("⚙️ 설정") { selected = "Settings" }
                Button(role: .destructive) { selected = "삭제" } label: {
                    Label("삭제", systemImage: "trash")
                }
            } label: {
                Label("옵션 선택", systemImage: "ellipsis.circle")
            }
            
            Text("선택한 항목: \(selected)")
                .padding()
        }
        .font(.title2)
    }
}

#Preview {
    MenuDemoView()
}

