//
//  PublisherView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 6/13/24.
//

import SwiftUI
import Combine

import SwiftUI

struct PublisherView: View {
    
    @ObservedObject var viewModel = PublisherViewModel()
    @State var textfieldValue: String = ""
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            TextField("숫자를 쓰고 버튼을 누르면 total에 더하기", text: $textfieldValue)
                .frame(width: 300, height: 70)
                .textFieldStyle(.roundedBorder)
            
            Text("Total => \(viewModel.totalSum)")
            Text("더할 값 => \(textfieldValue)")
            
            Button {
                viewModel.apply(.buttonPress(textfieldValue))
            } label: {
                Text("더하기")
            }
        }
        .alert(isPresented: $viewModel.shownError, content: {
            Alert(title: Text(viewModel.errorMessage))
        })
    }
}

#Preview {
    PublisherView()
}
