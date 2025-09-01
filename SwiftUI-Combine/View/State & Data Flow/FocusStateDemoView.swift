//
//  FocusStateDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import Foundation
import SwiftUI

struct FocusStateDemoView: View {
    @FocusState private var isFocused: Bool
    @State private var text: String = "승욱"
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("이름 입력", text: $text)
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
                .frame(maxWidth: 200)
            
            Button(isFocused ? "Focuse 해제" : "Focuse 주기") {
                isFocused.toggle()
            }
        }
    }
}

#Preview {
    FocusStateDemoView()
}
