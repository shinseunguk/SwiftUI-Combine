//
//  DatePickerDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/3/25.
//

import SwiftUI

struct DatePickerDemoView: View {
    var body: some View {
        TabView {
            WheelDatePickerStyleView()
                .tabItem {
                    Image(systemName: "dial.max") // 회전 휠 느낌
                    Text("Wheel")
                }
                .tag(1)
            
            CompactDatePickerStyleView()
                .tabItem {
                    Image(systemName: "calendar.badge.clock") // 작은 달력 + 시계
                    Text("Compact")
                }
                .tag(2)
            
            GraphicalDatePickerStyleView()
                .tabItem {
                    Image(systemName: "calendar") // 그래픽 달력
                    Text("Graphical")
                }
                .tag(3)
            
            AutomaticDatePickerStyleView()
                .tabItem {
                    Image(systemName: "gearshape") // 자동 설정
                    Text("Automatic")
                }
                .tag(4)
        }
    }
}

struct WheelDatePickerStyleView: View {
    @State private var selectedDate = Date()
    @State private var birthday = Date()
    
    // 날짜 범위 (오늘 ~ 1년 뒤까지)
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let now = Date()
        let oneYearAfter = calendar.date(byAdding: .year, value: 1, to: now)!
        return now...oneYearAfter
    }()
    
    var body: some View {
        VStack(spacing: 30) {
            
            // 기본 DatePicker
            DatePicker("Select a date", selection: $selectedDate)
                .padding()
            
            // 날짜와 시간 선택
            DatePicker("Pick Date & Time", selection: $selectedDate,
                       displayedComponents: [.date, .hourAndMinute])
            .padding()
            
            // 범위 제한된 DatePicker
            DatePicker("", selection: $birthday, in: dateRange, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.wheel)
                .padding()
            
            // 선택된 값 표시
            Text("Selected: \(selectedDate.formatted(date: .long, time: .shortened))")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .navigationTitle("DatePicker Demo")
    }
}

struct CompactDatePickerStyleView: View {
    @State private var birthday = Date()
    
    // 날짜 범위 (오늘 ~ 1년 뒤까지)
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let now = Date()
        let oneYearAfter = calendar.date(byAdding: .year, value: 1, to: now)!
        return now...oneYearAfter
    }()
    
    var body: some View {
        VStack(spacing: 30) {
            // 범위 제한된 DatePicker
            DatePicker("", selection: $birthday, in: dateRange, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.compact)
                .padding()
        }
        .padding()
        .navigationTitle("DatePicker Demo")
    }
}

struct GraphicalDatePickerStyleView: View {
    @State private var birthday = Date()
    
    // 날짜 범위 (오늘 ~ 1년 뒤까지)
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let now = Date()
        let oneYearAfter = calendar.date(byAdding: .year, value: 1, to: now)!
        return now...oneYearAfter
    }()
    
    var body: some View {
        VStack(spacing: 30) {
            // 범위 제한된 DatePicker
            DatePicker("", selection: $birthday, in: dateRange, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.graphical)
                .padding()
        }
        .padding()
        .navigationTitle("DatePicker Demo")
    }
}

struct AutomaticDatePickerStyleView: View {
    @State private var birthday = Date()
    
    // 날짜 범위 (오늘 ~ 1년 뒤까지)
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let now = Date()
        let oneYearAfter = calendar.date(byAdding: .year, value: 1, to: now)!
        return now...oneYearAfter
    }()
    
    var body: some View {
        VStack(spacing: 30) {
            // 범위 제한된 DatePicker
            DatePicker("", selection: $birthday, in: dateRange, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.automatic)
                .padding()
        }
        .padding()
        .navigationTitle("DatePicker Demo")
    }
}

#Preview {
    DatePickerDemoView()
}
