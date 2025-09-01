//
//  NamespaceDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import Foundation
import SwiftUI

import SwiftUI
 
struct NamespaceDemoView: View {
    @State private var isFlipped = false
    @Namespace private var animation
    
    var body: some View {
        HStack {
            // 'icon' <-> 'icon' 끼리 전환.
            // 'title' <-> 'title' 끼리 전환.
            if isFlipped {
                Text("텍스트 입니다.")
                    .font(.subheadline)
                    .matchedGeometryEffect(id: "title", in: animation)
                Image(systemName: "arrow.right")
                    .font(.title2)
                    .matchedGeometryEffect(id: "icon", in: animation)
            } else {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .matchedGeometryEffect(id: "icon", in: animation)
                Text("텍스트 입니다.")
                    .font(.subheadline)
                    .matchedGeometryEffect(id: "title", in: animation)
               
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}
#Preview {
    NamespaceDemoView()
}
