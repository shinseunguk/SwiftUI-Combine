//
//  PastButtonDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/5/25.
//

import SwiftUI

struct PastButtonDemoView: View {
    @State var pastedText: String = ""
    
    var body: some View {
        VStack{
            TextField("값을 넣고 복사해 주세요.", text: $pastedText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 16)
            PasteButton(payloadType: String.self) { strings in
                pastedText = strings[0]
            }
        }
    }
}

#Preview {
    PastButtonDemoView()
}
