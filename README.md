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

### State & Data Flow (상태 관리)
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

### Observation (iOS 17+)
- **Observable**: 새로운 `@Observable` 매크로 패턴
- **Bindable**: `@Bindable`을 활용한 Observable 객체 바인딩

### Result Builders & UI 구성
- **ViewBuilder**: 커스텀 뷰 컴포저블 패턴
- **ToolbarContentBuilder**: 툴바 구성 요소 빌더

### 데이터 스토어 연동
- **SwiftData**: `@Query`를 활용한 최신 데이터 관리 (Todo CRUD)

### 앱 라이프사이클
- **UIApplicationDelegateAdaptor**: SwiftUI 앱에 UIKit AppDelegate 연결

## 🏗️ 프로젝트 구조

```
SwiftUI-Combine/
├── App/
│   ├── SwiftUI_CombineApp.swift      # 메인 앱 진입점
│   └── AppDelegate.swift             # UIKit AppDelegate 연동
├── View/
│   ├── ContentView.swift             # 메인 네비게이션 뷰
│   └── State & Data Flow/            # 상태 관리 데모 뷰들
├── Protocol/
│   └── ViewModel.swift               # ViewModel 프로토콜
└── Resources/                        # 리소스 파일들
```

## 🚀 시작하기

### 필요 사항
- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+

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

- **네비게이션 구조 정리**: 구현 완료된 기능들만 남기고 메뉴 정리
- **UIApplicationDelegateAdaptor**: SwiftUI 앱에 UIKit 라이프사이클 연동
- **SwiftData 통합**: 최신 데이터 관리 패턴 구현
- **iOS 17+ 기능**: Observable, Bindable 패턴 완전 구현

---

이 프로젝트는 SwiftUI와 Combine을 학습하는 개발자들을 위한 실습 자료로 활용할 수 있습니다.