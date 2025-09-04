//
//  GaugeDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import Foundation
import SwiftUI

struct GaugeDemoView: View {
    @State private var progress: Double = 0.5
    
    var body: some View {
        VStack(spacing: 40) {
            
            // 기본 게이지
            Gauge(value: progress) {
                Text("Progress")
            }
            .padding()
            
            // 최소/최대 범위 지정 게이지
            Gauge(value: progress, in: 0...1) {
                Text("Download")
            } currentValueLabel: {
                Text("\(Int(progress * 100))%")
            } minimumValueLabel: {
                Text("0%")
            } maximumValueLabel: {
                Text("100%")
            }
            .padding()
            
            // Circular 스타일
            Gauge(value: progress) {
                Text("Battery")
            } currentValueLabel: {
                Text("\(Int(progress * 100))%")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.green)
            .frame(width: 100, height: 100)
            
            // Linear 스타일
            Gauge(value: progress) {
                Text("Loading")
            }
            .tint(.blue)
            .padding()
            
            Slider(value: $progress, in: 0...1)
                .padding()
        }
        .navigationTitle("Gauge Demo")
    }
}

#Preview {
    GaugeDemoView()
}
