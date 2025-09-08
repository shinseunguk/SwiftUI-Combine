//
//  TextEditorDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct TextEditorDemoView: View {
    @State private var text: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("메모")
                .font(.headline)

            ZStack(alignment: .topLeading) {
                // ✅ Placeholder (text가 비어있을 때만 보임)
                if text.isEmpty {
                    Text("여기에 내용을 입력하세요...")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 14)
                        .zIndex(200)
                }

                TextEditor(text: $text)
                    .padding(8)
                    .frame(height: 200)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .autocorrectionDisabled(true)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .foregroundColor(.primary)
            }

            Button("저장") {
                print("저장된 텍스트: \(text)")
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    TextEditorDemoView()
}
