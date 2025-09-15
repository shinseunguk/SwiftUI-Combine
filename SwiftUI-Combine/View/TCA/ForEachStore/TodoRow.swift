//
//  TodoRow.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/15/25.
//


import SwiftUI
import ComposableArchitecture

struct TodoRow: View {
    @Bindable var store: StoreOf<TodoFeature>
    
    var body: some View {
        HStack {
            Button {
                store.send(.toggle)
            } label: {
                Image(systemName: store.isDone ? "checkmark.circle.fill" : "circle")
            }
            TextField(
                "제목",
                text: $store.title.sending(\.titleChanged)
            )
        }
    }
}
