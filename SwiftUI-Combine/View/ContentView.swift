//
//  ContentView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 6/12/24.
//

import SwiftUI

enum Constants {
    static var combineList = [
        "Publisher의 이해",
        "2"
    ]
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Combine") {
                    
                    ForEach(Constants.combineList, id: \.self) { value in
                        NavigationLink(destination: destinationView(for: value)) {
                            Text(value)
                        }
                    }
                }
            }
            .navigationTitle("Combine 예제")
        }
    }
    
    @ViewBuilder
        private func destinationView(for value: String) -> some View {
            switch value {
            case "1":
                Text("This is the view for item 1")
            case "2":
                Text("This is the view for item 2")
            default:
                Text("This is the default view")
            }
        }
}

#Preview {
    ContentView()
}
