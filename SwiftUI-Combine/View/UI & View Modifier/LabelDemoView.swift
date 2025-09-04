//
//  LabelDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import Foundation
import SwiftUI

struct LabelDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            // 기본 Label
            Label("SwiftUI", systemImage: "swift")
            
            // 스타일 적용
            Label("Favorites", systemImage: "star.fill")
                .labelStyle(.titleAndIcon)
                .foregroundStyle(.yellow)
            
            // 아이콘만
            Label("Settings", systemImage: "gearshape")
                .labelStyle(.iconOnly)
                .foregroundStyle(.blue)
            
            // 텍스트만
            Label("Profile", systemImage: "person.crop.circle")
                .labelStyle(.titleOnly)
                .font(.headline)
            
            // 커스텀 Label (아이콘 + 텍스트)
            Label {
                Text("Custom Label")
                    .font(.title3)
                    .foregroundStyle(.purple)
            } icon: {
                Circle()
                    .fill(.purple)
                    .frame(width: 24, height: 24)
                    .overlay(
                        Image(systemName: "bolt.fill")
                            .foregroundStyle(.white)
                    )
            }
        }
        .padding()
        .navigationTitle("Label Demo")
    }
}

#Preview {
    LabelDemoView()
}
