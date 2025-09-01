//
//  MainActorDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import Foundation
import SwiftUI

// ViewModel이 항상 메인 스레드에서 실행되도록 보장
@MainActor
class CounterViewModel: ObservableObject {
    @Published var count = 0
    
    func increment() {
        count += 1
    }
    
    // 비동기 작업이 있어도 UI 갱신은 메인 스레드에서 안전하게 실행
    func loadData() async {
        // 네트워크 통신 (백그라운드 실행)
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1초
        
        // 결과 UI 반영 (MainActor 보장됨)
        count = Int.random(in: 0...100)
    }
}

struct MainActorDemoView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(viewModel.count)")
                .font(.largeTitle)
            
            Button("Increment") {
                viewModel.increment()
            }
            
            Button("Load Data (Async)") {
                Task {
                    await viewModel.loadData()
                }
            }
        }
        .padding()
    }
}


#Preview {
    MainActorDemoView()
}
