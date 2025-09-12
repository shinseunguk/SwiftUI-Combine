//
//  ChildFeature.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/12/25.
//

import ComposableArchitecture
import SwiftUI

struct ChildFeature: Reducer {
    @ObservableState
    struct State: Equatable {
        var count = 0
    }
    
    enum Action: FeatureAction, Equatable {
        // View에서 발생하는 액션
        enum ViewAction: Equatable {
            case plusTapped
            case closeTapped
        }
        // Reducer 내부 동기 액션
        enum InnerAction: Equatable {
            case incremented
        }
        // 비동기 액션 (예제에선 미사용)
        enum AsyncAction: Equatable {}
        // 자식의 자식 스코프 (없음)
        enum ScopeAction: Equatable {}
        // 부모에게 전달할 델리게이트
        enum DelegateAction: Equatable {
            case closeRequested
        }
        
        case view(ViewAction)
        case inner(InnerAction)
        case async(AsyncAction)
        case scope(ScopeAction)
        case delegate(DelegateAction)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .view(.plusTapped):
                return .send(.inner(.incremented))
                
            case .inner(.incremented):
                state.count += 1
                return .none
                
            case .view(.closeTapped):
                // 부모에게 닫기 요청을 델리게이트로 전달
                return .send(.delegate(.closeRequested))
                
            case .async, .scope, .delegate:
                return .none
            }
        }
    }
}
