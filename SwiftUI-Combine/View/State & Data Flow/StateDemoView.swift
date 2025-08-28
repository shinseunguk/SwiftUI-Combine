//
//  StateDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 8/28/25.
//

import Foundation
import SwiftUI

struct StateDemoView: View {
    @State private var isOnOff = false
    
    var body: some View {
        VStack {
            Image(systemName: isOnOff ? "lightbulb.max.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundStyle(isOnOff ? .yellow : .black)
            
            Spacer()
                .frame(height: 20)
            
            Button("Toggle") {
                isOnOff.toggle()
            }
        }
    }
}

#Preview {
    StateDemoView()
}
