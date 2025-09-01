//
//  ScaledMetricDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import Foundation
import SwiftUI

struct ScaledMetricDemoView: View {
    @ScaledMetric var iconSize: CGFloat = 24
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Dynamic Type에 맞게 아이콘 크기가 조정됩니다.")
                .font(.body)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: iconSize, height: iconSize)
                .foregroundStyle(.yellow)
        }
        .padding()
    }
}

struct ScaledMetricRelativeExample: View {
    @ScaledMetric(relativeTo: .body) var padding: CGFloat = 8
    
    var body: some View {
        Text("Padding도 함께 조정됨")
            .padding(padding)
            .border(.blue)
    }
}

#Preview {
    ScaledMetricDemoView()
    ScaledMetricRelativeExample()
}
