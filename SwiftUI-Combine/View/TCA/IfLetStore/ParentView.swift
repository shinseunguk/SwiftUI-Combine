//
//  ParentView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/12/25.
//

import SwiftUI
import ComposableArchitecture

struct ParentView: View {
    @Bindable var store: StoreOf<ParentFeature>
    
    var body: some View {
        VStack(spacing: 16) {
            Text("메시지: \(store.message)")
            
            HStack {
                Button("Fetch") { store.send(.view(.fetchTapped)) }
                Button("자식 열기") { store.send(.view(.showChildTapped)) }
            }
            
            // 부모 → 자식 Store 투영
            IfLetStore(
                store.scope(
                    state: \.child,
                    action: { .scope($0) } // ChildFeature.Action → ParentFeature.Action
                )
            ) { childStore in
                Text("자식 카운트: \(childStore.count)").font(.headline)
                Divider().padding(.vertical, 8)
                ChildView(store: childStore)
            } else: {
                Text("자식 없음").foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    ParentView(
        store: Store(
            initialState: ParentFeature.State(),
            reducer: { ParentFeature()._printChanges() }
        )
    )
}
