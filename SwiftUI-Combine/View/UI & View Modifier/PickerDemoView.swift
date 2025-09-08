//
//  PickerDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/5/25.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct PickerDemoView: View {
    @State private var selectedFlavor: Flavor = .chocolate
    
    var body: some View {
        VStack {
            List {
                Picker("automatic", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
            }
            .pickerStyle(.automatic)
            
            List {
                Picker("inline", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
            }
            .pickerStyle(.inline)
            
            List {
                Picker("menu", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
            }
            .pickerStyle(.menu)
            
            List {
                Picker("navigationLink", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
            }
            .pickerStyle(.navigationLink)
            
            List {
                Picker("palette", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
            }
            .pickerStyle(.palette)
            
            List {
                Picker("segmented", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
            }
            .pickerStyle(.segmented)
            
            List {
                Picker("wheel", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
            }
            .pickerStyle(.wheel)
        }
    }
}

#Preview {
    PickerDemoView()
}

