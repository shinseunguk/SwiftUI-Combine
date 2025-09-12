//
//  TCADemoFeature.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/9/25.
//

import ComposableArchitecture
import Combine

@Reducer
struct TCADemoFeature {
    
    @ObservableState
    struct State: Equatable {
        var count = 0
    }
    
    enum Action: CaseIterable {
        case increment
        case decrement
        case reset
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .increment:
                state.count += 1
                return .none
            case .decrement:
                state.count -= 1
                return .none
            case .reset:
                state.count = 0
                return .none
            }
        }
    }
}
