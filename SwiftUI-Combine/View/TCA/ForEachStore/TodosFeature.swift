//
//  TodosFeature.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/15/25.
//


import Foundation
import ComposableArchitecture

@Reducer
struct TodosFeature {
    
    @ObservableState
    struct State: Equatable {
        var todos: IdentifiedArrayOf<TodoFeature.State> = []
        
        var completedCount: Int {
            todos.filter(\.isDone).count
        }
    }
    
    @CasePathable
    enum Action: Equatable {
        case addButtonTapped
        case todo(IdentifiedActionOf<TodoFeature>)
        case remove(IndexSet)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.todos.append(.init(id: UUID(), title: "새 할 일"))
                return .none
                
            case .remove(let offsets):
                state.todos.remove(atOffsets: offsets)
                return .none
                
            case .todo:
                return .none
            }
        }
        .forEach(\.todos, action: \.todo) {
            TodoFeature()
        }
    }
}
