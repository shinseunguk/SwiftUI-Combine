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
    
    init(store: StoreOf<TCADemoFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("TCA Counter Demo")
                .font(.title)
                .fontWeight(.bold)
            
            Text("\(store.count)")
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
                Button(action: { store.send(.decrement) }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                .disabled(store.count <= 0)
                
                Button(action: { store.send(.increment) }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
                
                Button(action: { store.send(.reset) }) {
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
