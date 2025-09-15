//
//  TodosView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/15/25.
//


import SwiftUI
import ComposableArchitecture

struct TodosView: View {
    let store: StoreOf<TodosFeature>
    
    var body: some View {
        VStack {
            List {
                ForEachStore(
                    store.scope(state: \.todos, action: \.todo)
                ) { todoStore in
                    TodoRow(store: todoStore)
                }
                .onDelete { store.send(.remove($0)) }
            }
            
            Button("추가") { store.send(.addButtonTapped) }
                .buttonStyle(.borderedProminent)
                .padding(.top, 8)
        }
        .padding()
    }
}
