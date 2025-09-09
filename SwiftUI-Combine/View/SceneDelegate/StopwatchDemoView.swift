//
//  StopwatchDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/9/25.
//

import SwiftUI
import Combine

// ViewModel
final class StopwatchVM: ObservableObject {
    @Published var elapsed: TimeInterval = 0
    
    private var ticker: AnyCancellable?
    private var startDate: Date?
    
    private let startKey = "stopwatch.startDate"
    
    // 타이머 시작
    func start() {
        let now = Date()
        startDate = now
        UserDefaults.standard.set(now, forKey: startKey)
        tick()
        resumeTicker()
    }
    
    // 저장된 값 복원
    func restoreIfNeeded() {
        if let saved = UserDefaults.standard.object(forKey: startKey) as? Date {
            startDate = saved
            tick()
            resumeTicker()
        }
    }
    
    // 타이머 멈춤
    func stop() {
        pauseTicker()
        startDate = nil
        UserDefaults.standard.removeObject(forKey: startKey)
        elapsed = 0
    }
    
    // UI 업데이트용 ticker
    func pauseTicker() {
        ticker?.cancel()
        ticker = nil
    }
    
    func resumeTicker() {
        guard ticker == nil else { return }
        ticker = Timer.publish(every: 0.2, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
    }
    
    func tick() {
        guard let start = startDate else { return }
        elapsed = max(0, Date().timeIntervalSince(start))
    }
}

// 뷰
struct StopwatchDemoView: View {
    @StateObject private var vm = StopwatchVM()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Background -> Foreground 이동에도\n타이머가 끊기지 않게 보이는 예시")
                .font(.system(size: 20, weight: .bold, design: .default))
            
            Text(formatTime(vm.elapsed))
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .padding()
            
            HStack {
                Button(action: { vm.start() }) {
                    Text("Start")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button(action: { vm.stop() }) {
                    Text("Stop")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            vm.restoreIfNeeded()
            vm.resumeTicker()
        }
        .onDisappear {
            vm.pauseTicker()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                vm.tick()        // 복귀 시 즉시 업데이트
                vm.resumeTicker()
            } else {
                vm.pauseTicker()
            }
        }
    }
    
    private func formatTime(_ interval: TimeInterval) -> String {
        let total = Int(interval.rounded())
        let h = total / 3600
        let m = (total % 3600) / 60
        let s = total % 60
        
        if h > 0 {
            return String(format: "%02d:%02d:%02d", h, m, s)
        } else {
            return String(format: "%02d:%02d", m, s)
        }
    }
}

#Preview {
    StopwatchDemoView()
}
