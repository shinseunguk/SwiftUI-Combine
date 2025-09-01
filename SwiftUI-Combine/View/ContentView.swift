//
//  ContentView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 6/12/24.
//

import SwiftUI
import Combine

// MARK: - Model
struct SectionData: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}

// MARK: - Constants (섹션 & 아이템)
enum Constants {
    static let sections: [SectionData] = [
        SectionData(title: "State & Data Flow", items: [
            "State 관리",
            "Binding",
            "ObservedObject & StateObject",
            "EnvironmentObject",
            "Environment 값",
            "AppStorage",
            "SceneStorage",
            "GestureState",
            "FocusState",
            "ScaledMetric",
            "Namespace (matchedGeometryEffect)",
            "MainActor"
        ]),
        SectionData(title: "Observation (iOS 17+ 권장)", items: [
            "Observable (iOS 17+)",
            "Bindable (iOS 17+)"
        ]),
        SectionData(title: "Result Builders & UI 구성", items: [
            "ViewBuilder",
            "SceneBuilder (코드 샘플)",
            "ToolbarContentBuilder",
            "CommandsBuilder (macOS 코드 샘플)"
        ]),
        SectionData(title: "데이터 스토어 연동", items: [
            "FetchRequest (Core Data) - 코드 샘플",
            "SectionedFetchRequest - 코드 샘플",
            "Query (SwiftData) - 코드 샘플"
        ]),
        SectionData(title: "앱/플랫폼 라이프사이클", items: [
            "UIApplicationDelegateAdaptor - 코드 샘플",
            "NSApplicationDelegateAdaptor - 코드 샘플",
            "WKApplicationDelegateAdaptor - 코드 샘플"
        ]),
    ]
}

// MARK: - Root
struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Constants.sections) { section in
                    Section(section.title) {
                        ForEach(section.items, id: \.self) { item in
                            NavigationLink(destination: destinationView(for: item)) {
                                Text(item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI+Combine 스터디")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    @ViewBuilder
    private func destinationView(for value: String) -> some View {
        switch value {
        case "State 관리": StateDemoView()
        case "Binding": BindingDemoView()
        case "ObservedObject & StateObject": ObservedObjectDemoView()
        case "EnvironmentObject": EnvironmentObjectDemoRoot()
        case "Environment 값": EnvironmentValueDemoView()
        case "AppStorage": AppStorageDemoView()
        case "SceneStorage": SceneStorageDemoView()
        case "GestureState": GestureStateDemoView()
        case "FocusState": FocusStateDemoView()
        case "ScaledMetric": ScaledMetricDemoView()
        case "Namespace (matchedGeometryEffect)": NamespaceDemoView()
        case "MainActor": MainActorDemoView()
//        case "Observable (iOS 17+)": ObservableDemoView()
//        case "Bindable (iOS 17+)": BindableDemoView()
//        case "ViewBuilder": ViewBuilderDemoView()
//        case "SceneBuilder (코드 샘플)": CodeSampleView(title: value, code: SampleCodes.sceneBuilder)
//        case "ToolbarContentBuilder": ToolbarBuilderDemoView()
//        case "CommandsBuilder (macOS 코드 샘플)": CodeSampleView(title: value, code: SampleCodes.commandsBuilder)
//        case "FetchRequest (Core Data) - 코드 샘플": CodeSampleView(title: value, code: SampleCodes.fetchRequest)
//        case "SectionedFetchRequest - 코드 샘플": CodeSampleView(title: value, code: SampleCodes.sectionedFetchRequest)
//        case "Query (SwiftData) - 코드 샘플": CodeSampleView(title: value, code: SampleCodes.swiftDataQuery)
//        case "UIApplicationDelegateAdaptor - 코드 샘플": CodeSampleView(title: value, code: SampleCodes.uiAppDelegateAdaptor)
//        case "NSApplicationDelegateAdaptor - 코드 샘플": CodeSampleView(title: value, code: SampleCodes.nsAppDelegateAdaptor)
//        case "WKApplicationDelegateAdaptor - 코드 샘플": CodeSampleView(title: value, code: SampleCodes.wkAppDelegateAdaptor)
        default:
            DetailView(title: value, description: "해당 예제는 아직 준비 중입니다.")
        }
    }
}

// MARK: - 공통 뷰
struct DetailView: View {
    let title: String
    let description: String
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(title).font(.title.bold())
                Text(description).foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
