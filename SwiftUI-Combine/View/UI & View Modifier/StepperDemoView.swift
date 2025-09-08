//
//  StepperDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct StepperDemoView: View {
    @State private var quantity: Int = 1
    @State private var value: Double = 0

    var body: some View {
        VStack(spacing: 30) {
            // 기본 Stepper (정수 값)
            Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10, step: 1)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
                .font(.headline) // 글꼴 스타일 변경
                .foregroundColor(.blue) // 텍스트 색상 변경

            // Double 값 조정 (0.0 ~ 1.0, step: 0.1)
            Stepper(value: $value, in: 0...1, step: 0.1) {
                Text("Value: \(value, specifier: "%.1f")")
            }
            .padding()
            .background(Color.green.opacity(0.1))
            .cornerRadius(8)
            .font(.body)
            .foregroundColor(.green)

            // action 기반 Stepper
            Stepper("Custom Action") {
                quantity += 2
            } onDecrement: {
                quantity = max(1, quantity - 2)
            }
            .padding()
            .background(Color.orange.opacity(0.1))
            .cornerRadius(8)
            .font(.subheadline)
            .foregroundColor(.orange)

            Spacer()
        }
        .padding()
        .navigationTitle("Stepper Demo")
    }
}

#Preview {
    StepperDemoView()
}
