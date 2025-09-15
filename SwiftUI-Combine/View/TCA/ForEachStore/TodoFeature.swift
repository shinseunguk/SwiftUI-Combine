//
//  TodoFeature.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/15/25.
//


import Foundation
import ComposableArchitecture

@Reducer
struct TodoFeature {
    
    @ObservableState
    struct State: Equatable, Identifiable {
        var id: UUID
        var title: String = ""
        var isDone: Bool = false
    }
    
    @CasePathable
    enum Action: Equatable {
        case toggle
        case titleChanged(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .toggle:
                state.isDone.toggle()
                return .none
                
            case let .titleChanged(text):
                state.title = text
                return .none
            }
        }
    }
}
