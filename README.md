# SwiftUI-Combine Study Project

SwiftUI와 Combine을 활용한 iOS 리액티브 프로그래밍 학습 프로젝트입니다.

## 📱 프로젝트 개요

이 프로젝트는 SwiftUI의 다양한 상태 관리 패턴과 데이터 플로우를 실습하고 학습하기 위해 만들어졌습니다. 각 기능별로 독립적인 데모 뷰를 구성하여 개념을 명확히 이해할 수 있도록 구성되었습니다.

## 🎯 주요 학습 목표

- SwiftUI의 다양한 상태 관리 패턴 이해
- iOS 17+ 새로운 Observable 패턴 학습
- Result Builders를 활용한 UI 구성 방법 습득
- 데이터 스토어(SwiftData, Core Data) 연동 방법 학습

## 📚 구현된 기능들

### 🔥 TCA (The Composable Architecture)
- **TCA 기초 예제**: Counter 앱을 통한 State, Action, Reducer 패턴 학습
  - 증가/감소/리셋 기능이 있는 카운터 구현
  - `@Reducer`, `@ObservableState` 활용
- **TCA IfLetStore**: Optional 상태 관리를 위한 부모-자식 구조 패턴
  - ParentFeature에서 ChildFeature의 생성/제거 관리
  - Optional State 바인딩 및 Action 전달
- **TCA ForEachStore**: 동적 컬렉션 관리를 위한 Todo 목록 패턴
  - TodosFeature: 할 일 목록 관리 및 완료 개수 추적
  - TodoFeature: 개별 할 일 상태 및 액션 관리
  - IdentifiedActionOf를 통한 타입 안전한 액션 관리
  - Modern TCA 바인딩 패턴 (@Bindable, $store.property.sending)

### ⏰ SceneDelegate 관련 예제
- **Stopwatch**: 시계/타이머 기능 데모

### 🔄 State & Data Flow (상태 관리)
- **State**: `@State`를 활용한 로컬 상태 관리
- **Binding**: `@Binding`을 통한 양방향 데이터 바인딩
- **ObservedObject & StateObject**: Observable 객체와 뷰 생명주기 관리
- **EnvironmentObject**: 환경 객체를 통한 전역 상태 공유
- **Environment 값**: 시스템 환경 값 접근 및 활용
- **AppStorage**: UserDefaults를 활용한 앱 설정 저장
- **SceneStorage**: Scene별 상태 저장 및 복원
- **GestureState**: 제스처 상태 관리 및 애니메이션
- **FocusState**: 키보드 포커스 프로그래밍 제어
- **ScaledMetric**: Dynamic Type 대응 크기 조정
- **Namespace**: matchedGeometryEffect를 활용한 뷰 전환
- **MainActor**: 스레드 안전 UI 갱신 보장

### ✨ Observation (iOS 17+)
- **Observable**: 새로운 `@Observable` 매크로 패턴
- **Bindable**: `@Bindable`을 활용한 Observable 객체 바인딩

### 🏗️ Result Builders & UI 구성
- **ViewBuilder**: 커스텀 뷰 컴포저블 패턴
- **ToolbarContentBuilder**: 툴바 구성 요소 빌더

### 💾 데이터 스토어 연동
- **SwiftData**: `@Query`를 활용한 최신 데이터 관리 (Todo CRUD)

### 🎨 UI & View Modifier (50+ 컴포넌트)
#### 기본 컴포넌트
- **Text, Button**: 텍스트 및 버튼 컴포넌트
- **TextField, TextEditor**: 텍스트 입력 컴포넌트
- **Toggle, Slider, Stepper**: 입력 제어 컴포넌트
- **Picker, DatePicker, ColorPicker**: 선택 컴포넌트

#### 레이아웃 & 네비게이션
- **List, ScrollView**: 스크롤 가능한 뷰 컴포넌트
- **Form, Section**: 폼 및 섹션 구성
- **TabView**: 탭 기반 네비게이션
- **NavigationView, NavigationSplit**: 네비게이션 구조

#### 고급 컴포넌트
- **Gauge, ProgressView**: 진행률 표시 컴포넌트
- **Menu, DisclosureGroup**: 메뉴 및 접을 수 있는 그룹
- **OutlineGroup**: 트리 구조 데이터 표시
- **ShareLink**: iOS 16+ 공유 기능
- **SignInWithAppleButton**: Apple 로그인 버튼

### 📱 앱 라이프사이클
- **UIApplicationDelegateAdaptor**: SwiftUI 앱에 UIKit AppDelegate 연결

## 🏗️ 프로젝트 구조

```
SwiftUI-Combine/
├── App/
│   ├── SwiftUI_CombineApp.swift      # 메인 앱 진입점
│   └── AppDelegate.swift             # UIKit AppDelegate 연동
├── View/
│   ├── ContentView.swift             # 메인 네비게이션 뷰
│   ├── TCA/                          # TCA 관련 데모
│   │   ├── 기초 예제/                  # TCA 기본 패턴
│   │   │   ├── TCADemoFeature.swift   # Counter Feature
│   │   │   └── TCADemoView.swift      # Counter 뷰
│   │   ├── IfLetStore/                # Optional 상태 관리
│   │   │   ├── ParentFeature.swift    # 부모 Feature
│   │   │   ├── ParentView.swift       # 부모 뷰
│   │   │   ├── ChildFeature.swift     # 자식 Feature
│   │   │   └── ChildView.swift        # 자식 뷰
│   │   └── ForEachStore/              # 동적 컬렉션 관리
│   │       ├── TodosFeature.swift     # Todo 목록 Feature
│   │       ├── TodosView.swift        # Todo 목록 뷰
│   │       ├── TodoFeature.swift      # 개별 Todo Feature
│   │       └── TodoRow.swift          # Todo 행 뷰
│   ├── SceneDelegate/                # Scene 관련 데모
│   │   └── StopwatchDemoView.swift   # 스톱워치 데모
│   ├── Annotation/                   # 상태 관리 데모 뷰들
│   │   ├── StateDemoView.swift       # @State 데모
│   │   ├── BindingDemoView.swift     # @Binding 데모
│   │   ├── ObservableDemoView.swift  # @Observable 데모
│   │   └── ... (기타 20+ 데모 뷰)
│   └── UI & View Modifier/           # UI 컴포넌트 데모 뷰들
│       ├── ButtonDemoView.swift      # Button 데모
│       ├── TextFieldDemoView.swift   # TextField 데모
│       └── ... (기타 50+ UI 데모 뷰)
├── Protocol/
│   └── ViewModel.swift               # ViewModel 프로토콜
└── Resources/                        # 리소스 파일들
```

## 🚀 시작하기

### 필요 사항
- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+

### 주요 의존성
- **ComposableArchitecture 1.22.2**: TCA 패턴 구현을 위한 라이브러리
- **ViewInspector 0.10.2**: SwiftUI 뷰 테스트를 위한 라이브러리

### 실행 방법
1. 프로젝트 클론 또는 다운로드
2. Xcode에서 `SwiftUI-Combine.xcodeproj` 열기
3. 시뮬레이터에서 실행

### 빌드 및 테스트 명령어
```bash
# 빌드
xcodebuild -project SwiftUI-Combine.xcodeproj -scheme SwiftUI-Combine build

# 테스트 실행
xcodebuild test -project SwiftUI-Combine.xcodeproj -scheme SwiftUI-Combine
```

## 📖 개발 진행 과정

이 프로젝트는 다음과 같은 순서로 개발되었습니다:

1. **프로젝트 초기 설정** - SwiftUI + Combine 기반 구조 설정
2. **기본 State 관리** - `@State`, `@Binding` 패턴 구현
3. **Observable 패턴** - `ObservedObject`, `StateObject` 구현
4. **환경 기반 상태** - `EnvironmentObject`, Environment 값 활용
5. **저장소 연동** - `AppStorage`, `SceneStorage` 구현
6. **고급 상태 관리** - `GestureState`, `FocusState`, `ScaledMetric` 등
7. **iOS 17+ 새 기능** - `@Observable`, `@Bindable` 패턴
8. **UI 빌더 패턴** - `@ViewBuilder`, `ToolbarContentBuilder`
9. **데이터 연동** - SwiftData를 활용한 CRUD 구현
10. **앱 라이프사이클** - UIApplicationDelegateAdaptor 연동
11. **50+ UI 컴포넌트** - 모든 SwiftUI 기본 컴포넌트 데모 구현
12. **TCA 패턴 추가** - The Composable Architecture 라이브러리 연동 및 Counter 예제 구현

## 🧪 테스트

프로젝트에는 주요 뷰 컴포넌트에 대한 단위 테스트가 포함되어 있습니다:
- `StateDemoView` 단위 테스트
- UI 테스트 및 런치 테스트

## 📝 커밋 컨벤션

이 프로젝트는 체계적인 개발 이력을 위해 다음 커밋 컨벤션을 따릅니다:

- `feat`: 새로운 기능 추가
- `fix`: 버그 수정
- `refactor`: 코드 리팩터링
- `test`: 테스트 추가/수정
- `docs`: 문서 업데이트

자세한 내용은 `CLAUDE.md` 파일을 참조하세요.

## 🔄 최근 업데이트

### 2025년 9월
- **TCA ForEachStore 패턴 완성**: 동적 컬렉션 관리를 위한 Todo 목록 구현
  - `TodosFeature`: 할 일 목록 관리 및 완료 개수 추적 기능
  - `TodoFeature`: 개별 할 일의 상태 변경 및 제목 수정 기능
  - Modern TCA 바인딩: `@Bindable`과 `$store.property.sending` 패턴 활용
  - `IdentifiedActionOf` 타입 안전성 보장
- **TCA IfLetStore 패턴 구현**: Optional 상태 관리를 위한 부모-자식 구조
  - `ParentFeature`에서 `ChildFeature`의 생성/제거 관리
  - Optional State 바인딩 및 Action 전달 패턴
- **TCA 패턴 구현 완료**: The Composable Architecture 라이브러리 추가 및 Counter 예제 완성
  - `TCADemoFeature`: State, Action, Reducer 패턴 완벽 구현
  - `TCADemoView`: 증가/감소/리셋 기능을 가진 인터랙티브한 카운터 UI
  - 시각적으로 아름다운 원형 배경의 카운터 디스플레이
- **프로젝트 구조 개선**: TCA 전용 폴더 구조 추가
- **의존성 관리**: ComposableArchitecture 1.22.2 정식 통합

### 이전 업데이트
- **50+ UI 컴포넌트**: 모든 SwiftUI 기본 컴포넌트 데모 구현 완료
- **네비게이션 구조 정리**: 구현 완료된 기능들만 남기고 메뉴 정리  
- **SwiftData 통합**: 최신 데이터 관리 패턴 구현
- **iOS 17+ 기능**: Observable, Bindable 패턴 완전 구현

---

이 프로젝트는 SwiftUI와 Combine을 학습하는 개발자들을 위한 실습 자료로 활용할 수 있습니다.
