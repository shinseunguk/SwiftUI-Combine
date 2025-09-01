//
//  EnvironmentValueDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import SwiftUI

struct EnvironmentValueDemoView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.colorSchemeContrast) private var contrast
    @Environment(\.horizontalSizeClass) private var hSize
    @Environment(\.dynamicTypeSize) private var dynType
    @Environment(\.locale) private var locale
    @Environment(\.timeZone) private var timeZone
    @Environment(\.layoutDirection) private var dir
    @Environment(\.editMode) private var editMode
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.undoManager) private var undoManager

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Group {
                Text("Scheme: \(colorScheme == .dark ? "Dark" : "Light") / Contrast: \(contrast == .increased ? "High" : "Normal")")
                Text("SizeClass(H): \(hSize?.description ?? "nil") / DynamicType: \(dynType.description)")
                Text("Locale: \(locale.identifier) / TZ: \(timeZone.identifier)")
                Text("Direction: \(dir == .rightToLeft ? "RTL" : "LTR")")
                Text("EditMode: \((editMode?.wrappedValue ?? .inactive).debugDescription) / Enabled: \(isEnabled.description)")
            }
            .font(.footnote)

            HStack {
                Button("뒤로/닫기") { dismiss() }
                Button("apple.com 열기") { openURL(URL(string: "https://apple.com")!) }
                Button("편집 토글") {
                    if let binding = editMode {
                        binding.wrappedValue = binding.wrappedValue == .active ? .inactive : .active
                    }
                }
                Button("Undo?") { undoManager?.undo() }
            }
        }
        .padding()
        .onChange(of: scenePhase) { phase in
            print("ScenePhase:", phase) // background로 갈 때 저장 등 처리
        }
    }
}

private extension UserInterfaceSizeClass {
    var description: String { self == .compact ? "compact" : "regular" }
}
private extension DynamicTypeSize {
    var description: String { String(describing: self) }
}
private extension Bool {
    var description: String { self ? "true" : "false" }
}
private extension EditMode {
    var debugDescription: String {
        switch self { case .active: "active"; case .inactive: "inactive"; case .transient: "transient" }
    }
}

#Preview {
    EnvironmentValueDemoView()
}
