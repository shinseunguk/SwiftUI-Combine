//
//  ObservableDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/2/25.
//

import Foundation
import SwiftUI

@Observable
class CounterModel {
    var count = 0
}

import SwiftUI

struct ObservableDemoView: View {
    @State var model = CounterModel()
    var body: some View {
        VStack(spacing: 20) {
            Text("count: \(model.count)")
            Button("count UP") {
                model.count += 1
            }
        }
    }
}

#Preview {
    ObservableDemoView()
}

