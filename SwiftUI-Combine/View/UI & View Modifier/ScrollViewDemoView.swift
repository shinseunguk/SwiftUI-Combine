//
//  ScrollViewDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct ScrollViewDemoView: View {
    var body: some View {
        VStack {
            Text("🍎 ScrollView Demo")
                .font(.title)
                .padding()

            // 기본 세로 스크롤
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(1...30, id: \.self) { index in
                        Text("Item \(index)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                }
            }
            .frame(height: 300)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(16)
            .padding()

            // 가로 스크롤
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(1...10, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.purple.opacity(0.4))
                            .frame(width: 120, height: 120)
                            .overlay(Text("Box \(index)"))
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ScrollViewDemoView()
}

