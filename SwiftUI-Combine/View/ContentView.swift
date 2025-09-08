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
            "ToolbarContentBuilder",
        ]),
        SectionData(title: "데이터 스토어 연동", items: [
            "Query (SwiftData) - 코드 샘플"
        ]),
        SectionData(title: "UI & View Modifier", items: [
            "Button",
            "Color Picker",
            "Date Picker",
            "Edit Button",
            "DisclosureGroup",
            "Form",
            "Gauge",
            "Group Box",
            "Label",
            "LabeledContent",
            "Link",
            "List",
            "Menu",
            "Multi Date Picker",
            "Navigation Link",
            "Navigation Split View",
            "Outline Group",
            "Paste Button",
            "Picker",
            "ProgressView",
            "RenameButton",
            "ScrollView",
            "Section",
            "Secure Field",
            "ShareLink",
            "Sign In With Apple Button",
            "Slider",
            "Stepper",
            "TabView",
            "Table",
            "Text",
            "Text Editor",
            "Text Field",
            "Toggle",
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
        case "Observable (iOS 17+)": ObservableDemoView()
        case "Bindable (iOS 17+)": BindableDemoView()
        case "ViewBuilder": ViewBuilderDemoView()
        case "ToolbarContentBuilder": ToolbarBuilderDemoView()
        case "Query (SwiftData) - 코드 샘플": SwiftDataView().modelContainer(for: Todo.self)
        
        case "Button": ButtonDemoView()
        case "Color Picker": ColorPickerDemoView()
        case "Date Picker": DatePickerDemoView()
        case "Edit Button": EditButtonDemoView()
        case "DisclosureGroup": DisclosureGroupDemoView()
        case "Form": FormDemoView()
        case "Gauge": GaugeDemoView()
        case "Group Box": FormAndGroupBoxDemoView()
        case "Label": LabelDemoView()
        case "LabeledContent": LabeledContentDemoView()
        case "Link": LinkDemoView()
        case "List": ListDemoView()
        case "Menu": MenuDemoView()
        case "Multi Date Picker": MultiDatePickerDemoView()
        case "Navigation Link": NavigationDemoView()
        case "Navigation Split View": NavigationSplitDemoView()
        case "Outline Group": OutlineGroupDemoView()
        case "Paste Button": PastButtonDemoView()
        case "Picker": PickerDemoView()
        case "ProgressView": ProgressDemoView()
        case "RenameButton": RenameButtonDemoView()
        case "ScrollView": ScrollViewDemoView()
        case "Section": SectionDemoView()
        case "Secure Field": SecureFieldDemoView()
        case "ShareLink": ShareLinkDemoView()
        case "Sign In With Apple Button": SignInWithAppleButtonDemoView()
        case "Slider": SliderDemoView()
        case "Stepper": StepperDemoView()
        case "TabView": TabViewDemoView()
        case "Text": TextDemoView()
        case "Text Editor": TextEditorDemoView()
            
        default: DetailView(title: value, description: "해당 예제는 아직 준비 중입니다.")
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
