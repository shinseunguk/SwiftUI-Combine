//
//  DisclosureGroupDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/3/25.
//

import SwiftUI

struct DisclosureGroupDemoView: View {
    @State private var showDisplay = true
    @State private var showSound = false
    @State private var brightness: Double = 0.7
    @State private var volume: Double = 0.5
    @State private var darkMode = false
    @State private var mute = false

    var body: some View {
        NavigationView {
            List {
                // 디스플레이 설정
                DisclosureGroup(isExpanded: $showDisplay) {
                    VStack(alignment: .leading, spacing: 16) {
                        Toggle(isOn: $darkMode) {
                            Label("Dark Mode", systemImage: "moon.stars.fill")
                        }
                        .tint(.purple)

                        VStack(alignment: .leading) {
                            Label("Brightness", systemImage: "sun.max.fill")
                            Slider(value: $brightness, in: 0...1)
                        }
                    }
                    .padding(.vertical, 8)
                } label: {
                    Label("Display", systemImage: "display")
                        .font(.headline)
                        .foregroundStyle(.blue)
                }

                // 사운드 설정
                DisclosureGroup(isExpanded: $showSound) {
                    VStack(alignment: .leading, spacing: 16) {
                        Toggle(isOn: $mute) {
                            Label("Mute", systemImage: "speaker.slash.fill")
                        }
                        .tint(.red)

                        VStack(alignment: .leading) {
                            Label("Volume", systemImage: "speaker.wave.2.fill")
                            Slider(value: $volume, in: 0...1)
                        }
                    }
                    .padding(.vertical, 8)
                } label: {
                    Label("Sound", systemImage: "speaker.wave.3.fill")
                        .font(.headline)
                        .foregroundStyle(.orange)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    DisclosureGroupDemoView()
}
