//
//  ColorPickerDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/3/25.
//

import SwiftUI

struct ColorPickerDemoView: View {
    @State private var selectedColor: Color = .blue
    
    var body: some View {
        VStack(spacing: 30) {
            Text("선택된 색상 미리보기")
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(selectedColor)
                .cornerRadius(12)
                .foregroundColor(.white)
                .shadow(radius: 5)
            
            // 기본 ColorPicker
            ColorPicker("색상 선택하기", selection: $selectedColor)
                .padding()
            
            // 지원하는 Opacity 조절 포함
            ColorPicker("투명도 포함 색상 선택", selection: $selectedColor, supportsOpacity: true)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("ColorPicker Demo")
    }
}

#Preview {
    ColorPickerDemoView()
}
