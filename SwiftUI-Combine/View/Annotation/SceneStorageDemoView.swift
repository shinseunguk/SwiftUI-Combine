//
//  SceneStorageDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import Foundation
import SwiftUI

struct Mail: Identifiable, Hashable {
    let id: String
    let subject: String
}

struct SceneStorageDemoView: View {
    let mails: [Mail] = [
        .init(id: "1", subject: "Welcome"),
        .init(id: "2", subject: "Your invoice"),
        .init(id: "3", subject: "Event info")
    ]

    // 선택된 항목 ID를 Scene 저장
    @SceneStorage("selectedMailID") private var selectedMailID: String?

    var body: some View {
        NavigationSplitView {
            List(mails, selection: Binding(
                get: { selectedMailID.flatMap { id in mails.first { $0.id == id } } },
                set: { selectedMailID = $0?.id }
            )) { mail in
                Text(mail.subject).tag(mail)
            }
            .navigationTitle("메일함")
        } detail: {
            if let id = selectedMailID, let mail = mails.first(where: { $0.id == id }) {
                Text("열린 메일: \(mail.subject)")
                    .padding()
            } else {
                Text("메일을 선택하세요").foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SceneStorageDemoView()
}
