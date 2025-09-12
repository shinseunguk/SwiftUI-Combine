//
//  ChildView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/12/25.
//

import SwiftUI
import ComposableArchitecture

struct ChildView: View {
    @Bindable var store: StoreOf<ChildFeature>
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Child count: \(store.count)").font(.title2)
            HStack {
                Button("+1") { store.send(.view(.plusTapped)) }
                Button("닫기") { store.send(.view(.closeTapped)) }
            }
        }
        .padding()
    }
}

