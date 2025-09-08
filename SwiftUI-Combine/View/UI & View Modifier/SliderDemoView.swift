//
//  SliderDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct SliderDemoView: View {
    @State private var value: Double = 50
    @State private var isDisabled: Bool = false

    var body: some View {
        VStack(spacing: 40) {
            Text("값: \(Int(value))")
                .font(.title2)

            Slider(value: $value, in: 0...100, step: 1) // step => step 을 지정하면 → 슬라이더가 그 단위로만 움직임 (즉, 불연속적인 값을 선택하게 됨)
                .tint(.purple) // 색상
                .padding(20) // 내부 여백
                .frame(width: 300, height: 60) // 크기
                .background(Color.gray.opacity(0.2)) // 배경
                .cornerRadius(15) // 둥근 모서리
                .shadow(radius: 5) // 그림자
                .disabled(isDisabled) // 비활성화 가능
                .opacity(isDisabled ? 0.5 : 1.0) // 투명도
                .scaleEffect(isDisabled ? 0.9 : 1.1) // 확대/축소
                .rotationEffect(.degrees(isDisabled ? 5 : 0)) // 회전

            Toggle("Slider 비활성화", isOn: $isDisabled)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Slider + Modifiers")
    }
}

#Preview {
    SliderDemoView()
}
