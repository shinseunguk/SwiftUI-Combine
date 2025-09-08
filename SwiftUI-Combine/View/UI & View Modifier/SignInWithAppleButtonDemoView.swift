//
//  SignInWithAppleButtonDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import Foundation
import SwiftUI
import _AuthenticationServices_SwiftUI

struct SignInWithAppleButtonDemoView: View {
    var body: some View {
        VStack {
            SignInWithAppleButton(
                onRequest: { request in
                    print("onRequest: \(request)")
                },
                onCompletion: { result in
                    print("onCompletion: \(result)")
                }
            )
            .frame(width: .infinity, height: 50)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    SignInWithAppleButtonDemoView()
}
