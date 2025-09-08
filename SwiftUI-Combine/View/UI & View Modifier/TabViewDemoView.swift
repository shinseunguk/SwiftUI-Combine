//
//  TabViewDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI

struct TabViewDemoView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            // 첫 번째 탭
            Text("홈 화면")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            // 두 번째 탭
            Text("검색 화면")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            // 세 번째 탭
            Text("설정 화면")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(2)
                .badge(3)
        }
        .accentColor(.purple) // ✅ 선택된 탭 색상
        .tabViewStyle(.automatic) // ✅ 기본 탭 스타일 (PageTabViewStyle로 바꿀 수도 있음)
        .onAppear { // ✅ 처음 나타날 때 동작
            print("TabView appeared")
        }
        .onChange(of: selectedTab) { previousValue, newValue in // ✅ 선택된 탭이 바뀔 때 동작
            print("previousValue: \(previousValue)")
            print("Selected tab changed to \(newValue)")
        }
    }
}

#Preview {
    TabViewDemoView()
}
