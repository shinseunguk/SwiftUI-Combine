//
//  SecureFieldDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct SecureFieldDemoView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @FocusState private var focusedField: Field?
    
    enum Field {
        case password, confirm
    }
    
    var body: some View {
        Form {
            Section(header: Text("비밀번호 입력")) {
                SecureField("비밀번호", text: $password)
                    .textContentType(.password)         // 자동완성 힌트
                    .keyboardType(.default)             // 키보드 타입
                    .submitLabel(.next)                 // 리턴키 라벨
                    .focused($focusedField, equals: .password)
                    .onSubmit {                         // 엔터 눌렀을 때 동작
                        focusedField = .confirm
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                SecureField("비밀번호 확인", text: $confirmPassword)
                    .textContentType(.password)
                    .keyboardType(.default)
                    .submitLabel(.done)
                    .focused($focusedField, equals: .confirm)
                    .onSubmit {
                        print("확인 완료")
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
            }
            
            Section {
                Button("가입하기") {
                    print("가입 시도")
                }
                .disabled(password.isEmpty || password != confirmPassword) // 비활성화 처리
            }
        }
        .navigationTitle("SecureField All Modifiers")
    }
}

#Preview {
    SecureFieldDemoView()
}
