//
//  ProgressDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct ProgressDemoView: View {
    @State private var value: Double = 0.35
    @State private var isLoading = true
    @State private var download: Double = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {

                // 1) 비정형(Indeterminate)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Indeterminate (스피너)")
                        .font(.headline)
                    ProgressView() // 기본 원형
                    ProgressView("불러오는 중…") // 라벨 포함
                }

                // 2) 정형(Determinate) - 원형
                VStack(alignment: .leading, spacing: 8) {
                    Text("Determinate - Circular")
                        .font(.headline)
                    ProgressView(value: value) {
                        Text("가져오는 중…")
                    } currentValueLabel: {
                        Text("\(Int(value*100))%")
                            .monospacedDigit()
                    }
                    .progressViewStyle(.circular) // 원형 강제
                }

                // 3) 정형(Determinate) - 선형
                VStack(alignment: .leading, spacing: 8) {
                    Text("Determinate - Linear")
                        .font(.headline)
                    ProgressView(value: value)
                        .progressViewStyle(.linear)
                }

                // 4) 스타일/크기/색상 커스터마이즈
                VStack(alignment: .leading, spacing: 8) {
                    Text("Style / Size / Tint")
                        .font(.headline)
                    ProgressView("처리 중…")
                        .progressViewStyle(.circular)
                        .controlSize(.large)    // .mini / .small / .regular / .large
                        .tint(.blue)            // iOS 15+
                    ProgressView(value: value)
                        .progressViewStyle(.linear)
                        .tint(.green)
                        .frame(maxWidth: 240)
                        .scaleEffect(x: 1, y: 2, anchor: .center) // 두께 키우기 트릭
                }

                // 5) 비동기 작업(샘플) - Task로 진행률 업데이트
                VStack(alignment: .leading, spacing: 8) {
                    Text("Async 진행률 업데이트")
                        .font(.headline)

                    ProgressView(value: download, total: 100) {
                        Text("다운로드 중…")
                    } currentValueLabel: {
                        Text("\(Int(download)) / 100")
                            .monospacedDigit()
                    }
                    .progressViewStyle(.linear)
                    .tint(.purple)

                    HStack(spacing: 12) {
                        Button("시작") { startDownload() }
                        Button("초기화") { download = 0 }
                    }
                }

                // 6) 조건부 로딩 UI
                VStack(alignment: .leading, spacing: 8) {
                    Text("조건부 로딩")
                        .font(.headline)
                    if isLoading {
                        ProgressView("로딩 중…")
                            .progressViewStyle(.circular)
                            .tint(.orange)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.green)
                        Text("완료!")
                    }

                    Button(isLoading ? "완료로 전환" : "다시 로딩") {
                        withAnimation(.easeInOut) {
                            isLoading.toggle()
                        }
                    }
                }

                // 7) 리스트/폼과 함께
                VStack(alignment: .leading, spacing: 8) {
                    Text("List / Form 내 Progress")
                        .font(.headline)
                    List {
                        HStack {
                            Text("업로드")
                            Spacer()
                            ProgressView(value: 0.7)
                                .frame(width: 120)
                        }
                        HStack {
                            Text("인덱싱")
                            Spacer()
                            ProgressView()
                                .controlSize(.small)
                        }
                    }
                    .frame(height: 160)
                }
            }
            .padding()
            .navigationTitle("ProgressView Demo")

        }
        .onAppear {
            // 데모용 값 흔들기
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                value = 0.8
            }
        }
    }

    private func startDownload() {
        Task {
            for step in 0...100 {
                try? await Task.sleep(nanoseconds: 30_000_000) // 0.03s
                await MainActor.run { download = Double(step) }
            }
        }
    }
}

#Preview {
    ProgressDemoView()
}
