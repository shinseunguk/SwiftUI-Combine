//
//  EnvironmentObjectDemoRoot.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import Foundation
import SwiftUI

final class SessionVM: ObservableObject {
    @Published var user = "guest"
}

struct EnvironmentObjectDemoRoot: View {
    @StateObject private var session = SessionVM()
    var body: some View {
        MainScreenView().environmentObject(session)
    }
}

struct MainScreenView: View {
    @EnvironmentObject var session: SessionVM
    var body: some View {
        VStack {
            Text("User: \(session.user)")
            Button("로그인 가정") { session.user = "SeungUk" }
        }
    }
}

#Preview {
    EnvironmentObjectDemoRoot()
}
