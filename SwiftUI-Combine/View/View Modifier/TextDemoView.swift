//
//  TextDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/2/25.
//

import Foundation
import SwiftUI

struct TextDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Hello World!1")
                    .frame(maxWidth: .infinity, alignment: .center)
            
                Text("Hello World!2")
                    .foregroundStyle(.brown)
            
                Text("Hello World!3")
                    .fontWeight(.bold)
                
                Text("Hello World!3")
                    .bold()
                
                Text("Hello World!4")
                    .bold(false) // 굵게
                
                Text("Hello World!5")
                    .underline(true, color: .red) // 밑줄
                
                Text("Hello World!6")
                    .italic(true) // 폰트 키울기
                
                Text("Hello World!")
                    .strikethrough(true, color: .black)
                
                Text("Hello World!")
                    .kerning(13)
                
                Text("Hello World!")
                    .tracking(15)
                
                Text("Hello World!")
                    .baselineOffset(10)
                
                Text("Hello World!7")
                    .foregroundStyle(.white)
                    .padding(30)
                    .background(Color.blue)
                
                Text("Hello World!8")
                    .fontDesign(.monospaced)
                
                Text("Hello World!9")
                    .font(.headline)
                
                Text("Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10 Hello World!10")
                    .lineLimit(2)
                    .lineSpacing(10)
                
                Text("Hello World!11")
                    .accessibilityLabel("Hello SwiftUI")
    //            accessibilityLabel:
    //            - 요소가 무엇인지 설명
    //            - 스크린 리더가 즉시 읽어주는 내용
    //            - 짧고 명확한 설명 (예: "닫기 버튼", "사용자 이름")
    //            - 실제 화면 텍스트를 대체할 수 있음
                
                Text("Hello World!!12")
                    .accessibilityHint("Heelo Swift")
//                accessibilityHint:
//                - 요소를 어떻게 사용하는지 설명
//                - 사용자가 추가 정보가 필요할 때 제공
//                - 동작이나 결과에 대한 힌트 (예: "탭하면 메뉴가 열립니다", "두 번 탭하면
//                편집 모드로 전환됩니다")
//                - 선택사항이며 더 자세한 설명
                
                Text("Hello World!13 abcde fghijklmnopqrstu Hello World!13 abcde fghijklmnopqrstuHello World!13 abcde fghijklmnopqrstu Hello World!13 abcde fghijklmnopqrstuHello World!13 abcde fghijklmnopqrstu Hello World!13 abcde fghijklmnopqrstu")
                    .lineLimit(2)
                    .truncationMode(.tail) // 텍스트 잘림 방식
                
                Text("Hello world! Hello world! Hello world! Hello world! Hello world!")
                    .allowsTightening(true) // 압축
                
                Text("Hello World!15")
                    .textCase(.lowercase)
                
                Text("Hello World!16")
                    .textCase(.uppercase)
                
                Text("Hello World!17")
                    .textSelection(.enabled) // 사용자가 Text 내용을 선택하고 복사할 수 있게 해주는 modifier
                
                Text("Hello World!18")
                    .onTapGesture {
                        print("Tapped (Hello World!18)")
                    }
                
                // 일반적인 텍스트 (부모 뷰에 맞춰 줄바꿈)
                Text("This is a very long text that will wrap to multiple lines")
                    .frame(width: 100)
                
                // fixedSize() 적용 (줄바꿈 없이 원래 크기 유지)
                Text("This is a very long text that will wrap to multiple lines")
                    .fixedSize()
                    .frame(width: 100)
                    .border(Color.red)
            }
        }
        .clipped()
    }
}

#Preview {
    TextDemoView()
}
