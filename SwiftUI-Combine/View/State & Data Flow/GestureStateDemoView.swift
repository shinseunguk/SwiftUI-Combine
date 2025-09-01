//
//  GestureStateDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import Foundation
import SwiftUI

struct GestureStateDemoView: View {
    @State private var finalOffset: CGSize = .zero
    @GestureState private var dragOffset: CGSize = .zero
    
    var body: some View {
        let dragGesture = DragGesture()
            .updating($dragOffset) { value, state, _ in
                state = value.translation
            }
            .onEnded { value in
                finalOffset.width += value.translation.width
                finalOffset.height += value.translation.height
            }
        
        return RoundedRectangle(cornerRadius: 16)
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .offset(
                x: finalOffset.width + dragOffset.width,
                y: finalOffset.height + dragOffset.height
            )
            .gesture(dragGesture)
            .animation(.spring(), value: dragOffset)
    }
}

#Preview {
    GestureStateDemoView()
}
