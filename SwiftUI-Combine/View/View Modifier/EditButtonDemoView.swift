//
//  EditButtonDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/3/25.
//

import Foundation
import SwiftUI

struct EditButtonDemoView: View {
    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]
    @State private var selectedStyle = 0
    
    var body: some View {
        NavigationView {
            VStack {
                // Style Picker
                Picker("List Style", selection: $selectedStyle) {
                    Text("카드").tag(0)
                    Text("그라데이션").tag(1)
                    Text("네온").tag(2)
                    Text("미니멀").tag(3)
                }
                .pickerStyle(.segmented)
                .padding()
                
                // List Content
                if selectedStyle == 0 {
                    CardStyleList()
                } else if selectedStyle == 1 {
                    GradientStyleList()
                } else if selectedStyle == 2 {
                    NeonStyleList()
                } else {
                    MinimalStyleList()
                }
            }
            .navigationTitle("Fruits")
            .toolbar {
                EditButton()
            }
        }
    }
    
    // MARK: - Card Style
    @ViewBuilder
    func CardStyleList() -> some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                HStack {
                    Image(systemName: fruitIcon(for: fruit))
                        .foregroundStyle(.orange)
                        .font(.title2)
                    
                    Text(fruit)
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("Fresh")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.green.opacity(0.2))
                        .foregroundStyle(.green)
                        .clipShape(.capsule)
                }
                .padding(.vertical, 8)
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                )
            }
            .onDelete { fruits.remove(atOffsets: $0) }
            .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(.gray.opacity(0.05))
    }
    
    // MARK: - Gradient Style
    @ViewBuilder
    func GradientStyleList() -> some View {
        List {
            ForEach(Array(fruits.enumerated()), id: \.element) { index, fruit in
                HStack {
                    Circle()
                        .fill(gradientColor(for: index))
                        .frame(width: 12, height: 12)
                    
                    Text(fruit)
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white.opacity(0.7))
                        .font(.caption)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .listRowBackground(
                    LinearGradient(
                        colors: [gradientColor(for: index), gradientColor(for: index).opacity(0.7)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                )
                .listRowInsets(EdgeInsets())
            }
            .onDelete { fruits.remove(atOffsets: $0) }
            .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(.black)
    }
    
    // MARK: - Neon Style
    @ViewBuilder
    func NeonStyleList() -> some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                HStack {
                    Text(fruit)
                        .font(.headline)
                        .foregroundStyle(.cyan)
                        .shadow(color: .cyan, radius: 5)
                    
                    Spacer()
                    
                    Circle()
                        .fill(.cyan)
                        .frame(width: 8, height: 8)
                        .shadow(color: .cyan, radius: 3)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.cyan.opacity(0.5), lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.black.opacity(0.8))
                        )
                        .shadow(color: .cyan.opacity(0.3), radius: 10)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                )
            }
            .onDelete { fruits.remove(atOffsets: $0) }
            .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(.black)
    }
    
    // MARK: - Minimal Style
    @ViewBuilder
    func MinimalStyleList() -> some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                HStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 4, height: 40)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(fruit)
                            .font(.headline)
                        
                        Text("Organic fruit")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .listRowBackground(Color.clear)
                .background(
                    Rectangle()
                        .fill(.white)
                        .overlay(
                            Rectangle()
                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                        )
                )
            }
            .onDelete { fruits.remove(atOffsets: $0) }
            .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
    
    // MARK: - Helper Functions
    private func fruitIcon(for fruit: String) -> String {
        switch fruit.lowercased() {
        case "apple": return "apple.logo"
        case "banana": return "leaf.fill"
        case "papaya": return "heart.fill"
        case "mango": return "sun.max.fill"
        default: return "circle.fill"
        }
    }
    
    private func gradientColor(for index: Int) -> Color {
        let colors: [Color] = [.purple, .blue, .green, .orange]
        return colors[index % colors.count]
    }
}

#Preview {
    EditButtonDemoView()
}
