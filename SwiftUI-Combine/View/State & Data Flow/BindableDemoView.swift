//
//  BindableDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/2/25.
//

import Foundation
import SwiftUI

@Observable
class User {
    var name: String = ""
    var age: Int = 20
}

struct BindableDemoView: View {
    @State var user = User()
    
    var body: some View {
        VStack {
            NameEditor(user: user)
            
            Spacer()
                .frame(height: 50)
            
            Text("현재 이름: \(user.name)")
            Text("현재 나이: \(user.age)")
        }
    }
}

struct NameEditor: View {
    @Bindable var user: User
    
    var body: some View {
        TextField("이름 입력", text: $user.name)
            .textFieldStyle(.roundedBorder)
            .frame(maxWidth: 200)
        
        Stepper("나이: \(user.age)", value: $user.age, in: 0...100)
            .frame(maxWidth: 200)
    }
}

#Preview {
    BindableDemoView()
}

