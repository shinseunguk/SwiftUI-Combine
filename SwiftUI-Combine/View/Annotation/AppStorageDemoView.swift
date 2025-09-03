//
//  AppStorageDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/1/25.
//

import Foundation
import SwiftUI

struct AppStorageDemoView: View {
    @AppStorage("isFristRun") private var isFirstRun: Bool = true
    
    var body: some View {
        if isFirstRun {
            Text("isFirstRun true")
        } else {
            Text("isFirstRun false")
        }
        
        Button(isFirstRun ? "true -> false" : "false -> true") {
            isFirstRun.toggle()
        }
    }
}

#Preview {
    AppStorageDemoView()
}
