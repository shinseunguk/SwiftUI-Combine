//
//  TextFieldDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct TextFieldDemoView: View {
    @State private var username: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("아이디 입력")
                .font(.headline)
            
            TextField("아이디를 입력하세요", text: $username)
                .textFieldStyle(.roundedBorder)        // 기본 둥근 스타일
                .padding(.horizontal)                  // 좌우 여백
                .autocapitalization(.none)             // 자동 대문자 변환 방지 (iOS 15 이하)
                .autocorrectionDisabled(true)          // 자동 수정 비활성화
                .textInputAutocapitalization(.never)   // iOS 16+ 대문자 변환 방지
                .keyboardType(.default)                // 키보드 타입 (이메일, 숫자패드 등 변경 가능)
                .submitLabel(.done)                    // 리턴 키 타입
                .onSubmit {
                    print("입력 완료: \(username)")
                }
            
            Button("로그인") {
                print("로그인 시도: \(username)")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    TextFieldDemoView()
}

