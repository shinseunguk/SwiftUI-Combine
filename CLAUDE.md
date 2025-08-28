# SwiftUI-Combine Study Project

This is a SwiftUI + Combine study project for understanding reactive programming in iOS development.

## Project Structure

- `SwiftUI-Combine/View/ContentView.swift` - Main navigation view with sections for different topics
- `SwiftUI-Combine/View/DetailView.swift` - Detail view for displaying content

## Git Commit Convention

### 커밋 규칙

1. Claude 서명 사용 안함
2. 커밋 메시지 형식: `<type>(<scope>)!: <subject>`
3. 한글로 커밋
4. 끝에 마침표 사용 안함

### 커밋 타입

| Type | 설명 | 버전 영향 |
|------|------|----------|
| `feat` | 기능 추가/변경 | minor |
| `fix` | 버그 수정 | patch |
| `perf` | 성능 개선 | patch |
| `refactor` | 내부 리팩터링(동작 동일) | none |
| `docs` | 문서 | none |
| `style` | 포맷/세미콜론/네이밍 등(비기능) | none |
| `test` | 테스트 추가/수정 | none |
| `build` | 빌드 시스템, 의존성 | none/patch |
| `ci` | CI 설정/스크립트 | none |
| `chore` | 잡무(코드/빌드 외) | none |
| `revert` | 특정 커밋 되돌림 | none |
| `deps` | 의존성 업/다운그레이드 | none/patch |

### 예시
```
feat(ui): 섹션 기반 네비게이션 구조 추가

DetailView struct를 별도 파일로 분리하고
SectionData 모델을 통한 동적 섹션 생성 구현

- ContentView에서 DetailView 분리
- 섹션별 아이템 관리 구조화
```

## Development Commands

### Building
```bash
xcodebuild -project SwiftUI-Combine.xcodeproj -scheme SwiftUI-Combine build
```

### Testing
```bash
xcodebuild test -project SwiftUI-Combine.xcodeproj -scheme SwiftUI-Combine
```

### Running
Open the project in Xcode and run the simulator.

## Study Topics

### State & Data Flow
- State management in SwiftUI
- Data binding patterns
- Observable objects and state objects
- Environment management

### Observation (iOS 17+)
- New Observable macro
- Bindable property wrapper

### Result Builders & UI Construction
- ViewBuilder patterns
- Scene and toolbar builders

### Data Store Integration
- Core Data integration
- SwiftData integration

### App Lifecycle
- App delegate adaptors for different platforms