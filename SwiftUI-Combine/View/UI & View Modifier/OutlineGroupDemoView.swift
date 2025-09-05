//
//  OutlineGroupDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/5/25.
//

//📌 보통 쓰이는 상황
//1. 파일 탐색기 UI
//Finder, Windows Explorer처럼 "폴더 안에 폴더, 그 안에 파일" 구조 보여줄 때

//2. 조직도 / 카테고리 뷰
//회사 조직도 (부서 → 팀 → 직원)
//쇼핑몰 카테고리 (의류 → 남성 → 셔츠 → 긴팔셔츠)

//3. 문서 목차 / 계층 데이터
//책/문서의 목차 (챕터 → 섹션 → 하위 섹션)
//Wiki 문서 구조

//4. 계층 메뉴
//앱 내 "설정" 같은 메뉴 트리
//옵션이 깊게 들어가는 경우 (환경설정 → 네트워크 → Wi-Fi → 세부 설정)

//5. JSON / 트리 구조 데이터 뷰어
//디버깅용으로 JSON 데이터를 트리 형태로 펼쳐보기

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
    var children: [Item]? = nil
}

let sampleData: [Item] = [
    Item(name: "🍎 Fruits", children: [
        Item(name: "Apple"),
        Item(name: "Banana"),
        Item(name: "Orange"),
    ]),
    Item(name: "🐶 Animals", children: [
        Item(name: "Dog"),
        Item(name: "Cat"),
        Item(name: "Bear")
    ]),
    Item(name: "📂 Empty Folder")
]

struct OutlineGroupDemoView: View {
    var body: some View {
        NavigationView {
            List {
                OutlineGroup(sampleData, children: \.children) { item in
                    Label(item.name, systemImage: item.children == nil ? "doc" : "folder")
                }
            }
            .navigationTitle("OutlineGroup Demo")
        }
    }
}

#Preview {
    OutlineGroupDemoView()
}
