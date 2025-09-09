//
//  TCADemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/9/25.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import Combine

struct TCADemoView: View {
    let store: StoreOf<TCADemoFeature>
    @ObservedObject var viewStore: ViewStoreOf<TCADemoFeature>
    
    init(store: StoreOf<TCADemoFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("TCA Counter Demo")
                .font(.title)
                .fontWeight(.bold)
            
            Text("\(viewStore.count)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .padding()
                .background(
                    Circle()
                        .fill(Color.blue.opacity(0.1))
                        .frame(width: 120, height: 120)
                )
            
            HStack(spacing: 20) {
                Button(action: { viewStore.send(.decrement) }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                .disabled(viewStore.count <= 0)
                
                Button(action: { viewStore.send(.increment) }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
                
                Button(action: { viewStore.send(.reset) }) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.title2)
                        .foregroundColor(.orange)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("TCA Demo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TCADemoView(
        store: Store(
            initialState: TCADemoFeature.State(),
            reducer: { TCADemoFeature()._printChanges() }
        )
    )
}
