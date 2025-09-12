//
//  TCAIfLetStoreDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/11/25.
//

import SwiftUI
import ComposableArchitecture

struct TCAIfLetStoreDemoView: View {
    let store: StoreOf<TCAIfLetStoreDemoFeature>
    
    var body: some View {
        VStack(spacing: 12) {
            Button("상세 열기") {
                store.send(.showDetailButtonTapped)
            }
            
            IfLetStore(
                store.scope(state: \.detail, action: \.detail)
            ) { detailStore in
                VStack {
                    Text("Detail Present!")
                    IfLetStoreDetailView(store: detailStore)
                    Button("닫기") {
                        store.send(.hideDetail)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            } else: {
                Text("상세가 없습니다.")
            }
        }
        .padding()
    }
}

struct TCAIfLetStoreDemoFeature: Reducer {
    struct State: Equatable {
        var detail: IfLetStoreDetailFeature.State?
    }
    @CasePathable
    enum Action: Equatable {
        case showDetailButtonTapped
        case hideDetail
        case detail(IfLetStoreDetailFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .showDetailButtonTapped:
                state.detail = .init()
                return .none
            case .hideDetail:
                state.detail = nil
                return .none
            case .detail(.textChanged(let newText)):
                // 자식 Feature의 action을 부모에서 처리할 수 있습니다
                print("Detail text changed to: \(newText)")
                return .none
            }
        }
        .ifLet(\.detail, action: \.detail) { IfLetStoreDetailFeature() }
    }
}

struct IfLetStoreDetailView: View {
    let store: StoreOf<IfLetStoreDetailFeature>
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text(viewStore.text)
                Button("텍스트 변경") {
                    store.send(.textChanged("변경된 텍스트"))
                }
            }
        }
    }
}

struct IfLetStoreDetailFeature: Reducer {
    struct State: Equatable {
        var text: String = "상세 화면"
    }
    @CasePathable
    enum Action: Equatable {
        case textChanged(String)
    }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .textChanged(newText):
                state.text = newText
                return .none
            }
        }
    }
}

#Preview {
    TCAIfLetStoreDemoView(
        store: Store(
            initialState: TCAIfLetStoreDemoFeature.State(),
            reducer: { TCAIfLetStoreDemoFeature()._printChanges() }
        )
    )
}


