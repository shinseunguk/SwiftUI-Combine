//
//  ObservedObjectDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 8/29/25.
//

import Foundation
import SwiftUI

final class CounterVM: ObservableObject {
    @Published var count = 0
}

struct ObservedObjectDemoView: View {
    @StateObject private var vm = CounterVM()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(vm.count)")
            Button("부모에서 증가") {
                vm.count += 1
            }
            ObservedObjectChildDemoView(vm: vm)
        }
    }
}

struct ObservedObjectChildDemoView: View {
    
    @ObservedObject var vm: CounterVM
    
    var body: some View {
        Button("자식에서 Count + 1") {
            vm.count += 1
        }
    }
}



#Preview {
    ObservedObjectDemoView()
}
