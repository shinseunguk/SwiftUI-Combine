//
//  ViewBuilderDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/2/25.
//

import Foundation
import SwiftUI

struct ViewBuilderDemoView: View {
    let items: [String] = ["사과", "바나나", "오렌지"]
    
    var body: some View {
        VStack {
            listSection(title: "과일 목록1") {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
            }
            
            listSection(title: "과일 목록2") {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
            }
            
            listSection(title: "과일 목록3") {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
    
    func listSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            content()
        }
        .padding()
        .border(Color.blue)
    }
}

#Preview {
    ViewBuilderDemoView()
}
