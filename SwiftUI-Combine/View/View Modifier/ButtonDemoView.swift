//
//  ButtonDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/3/25.
//

import Foundation
import SwiftUI

struct ButtonDemoView: View {
    @State var isPressed: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ComponentButton("Complete Button")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 12))
                    .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
//                    .disabled(isLoading)
//                    .opacity(isLoading ? 0.6 : 1.0)
                    .accessibilityLabel("완료")
                
                ComponentButton("animation Button")
                    .scaleEffect(isPressed ? 0.95 : 1.0)
                    .animation(.easeInOut(duration: 0.1), value: isPressed)
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in
                                if !isPressed {
                                    isPressed = true
                                }
                            }
                            .onEnded { _ in
                                isPressed = false
                            }
                    )
                
                ComponentButton("Shadow Button")
                    .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 2)
                
                ComponentButton("Border Button")
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.red, lineWidth: 2)
                    )
                
                ComponentButton("Haptic Button")
                    .onTapGesture {
                        let impact = UIImpactFeedbackGenerator(style: .medium)
                        impact.impactOccurred()
                    }
                
                ComponentButton("Font Button")
                    .font(.largeTitle)
                
                ComponentButton("Disabled Button")
                    .disabled(true)
                
                ComponentButton("Enabled Button")
                    .disabled(false)
                
                ComponentButton("Opacity Button")
                    .opacity(0.5)
                
                ComponentButton("clipShape(circle) Button")
                    .frame(width: 200, height: 200)
                    .background(.red)
                    .clipShape(.circle)
                
                ComponentButton("clipShape(capsule) Button")
                    .background(.red)
                    .clipShape(.capsule)
                
                ComponentButton("clipShape(buttonBorder) Button")
                    .clipShape(.buttonBorder)
                
                ComponentButton("clipShape(containerRelative) Button")
                    .clipShape(.containerRelative) // 부모 컨테이너의 모양을 따라감
                
                ComponentButton("clipShape(ellipse) Button")
                    .clipShape(.ellipse)
                
                ComponentButton("clipShape(rect) Button")
                    .clipShape(.rect)
                
                Button("bordered Button") { print("click: Default Button ✅") }.buttonStyle(.bordered)
                Button("borderedProminent Button") { print("click: Default Button ✅") }.buttonStyle(.borderedProminent)
                Button("plain Button") { print("click: Default Button ✅") }.buttonStyle(.plain)
                Button("borderless Button") { print("click: Default Button ✅") }.buttonStyle(.borderless)
                Button("automatic Button") { print("click: Default Button ✅") }.buttonStyle(.automatic)
            }
        }
        .clipped()
    }
}

@ViewBuilder
func ComponentButton(_ title: String) -> some View {
    Button(title) {
        print("click: \(title) ✅")
    }
    .foregroundStyle(.white)
    .padding()
    .background(.blue)
}

#Preview {
    ButtonDemoView()
}
