//
//  BindingDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 8/29/25.
//

import Foundation
import SwiftUI

struct BindingDemoView: View {
    @State var name: String = "승욱"
    var body: some View {
        VStack {
            BindingDemoChildView(name: $name)
        }
    }
}

struct BindingDemoChildView: View {
    @Binding var name: String
    var body: some View {
        VStack {
            Text("안녕, \(name)")
            TextField("이름", text: $name)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    BindingDemoView()
}
