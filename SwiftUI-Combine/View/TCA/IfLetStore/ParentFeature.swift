//
//  ParentFeature.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/12/25.
//

import ComposableArchitecture
import SwiftUI

struct ParentFeature: Reducer {
    @Dependency(\.continuousClock) var clock
    
    @ObservableState
    struct State: Equatable {
        var message: String = "아직 없음"
        var child: ChildFeature.State? = nil
    }
    
    enum Action: FeatureAction, Equatable {
        // View에서 발생하는 액션
        enum ViewAction: Equatable {
            case fetchTapped
            case showChildTapped
        }
        // 내부 동기 액션
        enum InnerAction: Equatable {
            case fetched(String)
        }
        // 비동기 액션
        enum AsyncAction: Equatable {
            case fetch
        }
        // 자식 리듀서 액션
        typealias ScopeAction = ChildFeature.Action
        // 상위(부모의 부모)로 전달할 델리게이트(예제에선 로그성)
        enum DelegateAction: Equatable {
            case childClosed
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
                
                // MARK: View → Async
            case .view(.fetchTapped):
                return .send(.async(.fetch))
                
                // MARK: Async → Inner
            case .async(.fetch):
                return .run { send in
                    try await clock.sleep(for: .milliseconds(300))
                    await send(.inner(.fetched("서버 응답: Hello!")))
                }
                
                // MARK: Inner 반영
            case let .inner(.fetched(text)):
                state.message = text
                return .none
                
                // MARK: 자식 표시
            case .view(.showChildTapped):
                state.child = .init()
                return .none
                
                // MARK: 자식에서 올라온 델리게이트 처리
            case .scope(.delegate(.closeRequested)):
                state.child = nil
                return .send(.delegate(.childClosed))
                
                // 기타 자식 액션은 특별 처리 없음
            case .scope:
                return .none
                
            case .delegate:
                return .none
            }
        }
        // 자식 도메인 합성: child가 존재할 때만 ChildFeature 동작
        .ifLet(\.child, action: /Action.scope) {
            ChildFeature()
        }
    }
}
