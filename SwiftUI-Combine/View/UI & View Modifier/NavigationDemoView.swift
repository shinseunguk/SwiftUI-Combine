//
//  NavigationDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import Foundation
import SwiftUI

struct NavigationDemoView: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "1.circle.fill") // 회전 휠 느낌
                Text("NavgationLink")
            }
            .tag(1)
            
            AppRoot().tabItem {
                Image(systemName: "2.circle.fill") // 회전 휠 느낌
                Text("NavigationPath")
            }
            .tag(2)
        }
    }
}

struct Home: View {
    var body: some View {
        NavigationStack {
            List(1 ..< 5) { id in
                NavigationLink("상세 \(id)", value: Route.detail(id))
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .detail(let id): Detail(id: id)
                }
            }
            .navigationTitle("홈")
        }
    }
}

struct AppRoot: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 12) {
                Button("상세 42로 이동") { path.append(Route.detail(42)) }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .detail(let id): Detail(id: id)
                }
            }
            .navigationTitle("홈")
        }
    }
}

struct Detail: View {
    let id: Int
    var body: some View {
        VStack(spacing: 8) {
            Text("상세 화면")
                .font(.title.bold())
            Text("아이템 ID: \(id)")
        }
        .padding()
        .navigationTitle("상세 \(id)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

enum Route: Hashable { case detail(Int) }

#Preview {
    NavigationDemoView()
}
