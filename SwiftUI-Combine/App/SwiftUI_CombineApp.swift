//
//  SwiftUI_CombineApp.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 6/12/24.
//

import SwiftUI

@main
struct SwiftUI_CombineApp: App {
    // SwiftUI 앱에 UIKit AppDelegate 연결
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
