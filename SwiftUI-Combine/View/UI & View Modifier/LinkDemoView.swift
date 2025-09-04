//
//  LinkDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import SwiftUI

struct LinkDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            // 기본 Link
            Link("Open Apple Website", destination: URL(string: "https://www.apple.com")!)
            
            // Label과 함께 쓰기
            Link(destination: URL(string: "https://developer.apple.com")!) {
                Label("Apple Developer", systemImage: "laptopcomputer")
            }
            .font(.title2)
            
            // 커스텀 스타일 적용
            Link("Swift.org", destination: URL(string: "https://swift.org")!)
                .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Link Demo")
    }
}

#Preview {
    LinkDemoView()
}
