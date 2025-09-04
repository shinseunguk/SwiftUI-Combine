//
//  MultiDatePickerDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/4/25.
//

import SwiftUI

struct MultiDatePickerDemoView: View {
    @State private var selectedDates: Set<DateComponents> = []

    var body: some View {
        VStack(spacing: 20) {
            MultiDatePicker("날짜 선택", selection: $selectedDates)
                .frame(maxHeight: 400) // 기본적으로 큰 뷰라 크기 조절 가능
                .environment(\.locale, Locale(identifier: "ko_KR"))
            
            Text("선택된 날짜 수: \(selectedDates.count)")
                .font(.headline)
            
            // 선택된 날짜 리스트
            List(Array(selectedDates), id: \.self) { dateComponent in
                if let date = Calendar.current.date(from: dateComponent) {
                    Text(date.formatted(date: .abbreviated, time: .omitted))
                }
            }
        }
        .padding()
        .navigationTitle("MultiDatePicker Demo")
    }
}

#Preview {
    MultiDatePickerDemoView()
}
