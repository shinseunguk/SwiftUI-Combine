//
//  ToggleDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct ToggleDemoView: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // 기본 토글
            Toggle("알림 받기", isOn: $isOn)
            
            // 커스텀 라벨
            Toggle(isOn: $isOn) {
                Label("Wi-Fi", systemImage: "wifi")
            }
            
            // 상태 표시
            Text(isOn ? "켜짐 ✅" : "꺼짐 ❌")
                .font(.headline)
                .foregroundColor(isOn ? .green : .red)
            
            Toggle("다크 모드", isOn: $isOn)
                .toggleStyle(.switch)   // 스위치 스타일
            
            Toggle("Bluetooth", isOn: $isOn)
                .tint(.blue)
            
            Toggle("사운드", isOn: $isOn)
                .labelsHidden()
            
            Toggle("자동 업데이트", isOn: $isOn)
                .disabled(true)
            
            Toggle("위치 서비스", isOn: $isOn)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
        }
        .padding()
    }
}

#Preview {
    ToggleDemoView()
}

