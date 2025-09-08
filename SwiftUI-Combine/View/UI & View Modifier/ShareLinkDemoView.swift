//
//  ShareLinkDemoView.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/8/25.
//

import SwiftUI
import UIKit   // iOS라면 명시적으로 임포트(필요한 경우)

struct ShareLinkDemoView: View {
    private let websiteURL = URL(string: "https://developer.apple.com")!

    private var renderedImage: UIImage {
        let symbol = Image(systemName: "swift")
            .font(.system(size: 160))
            .foregroundStyle(.orange)
        let renderer = ImageRenderer(content: symbol)
        return renderer.uiImage ?? UIImage()
    }

    /// UIImage를 PNG로 임시 파일에 저장하고 그 URL을 반환
    private func saveTempPNG(_ image: UIImage) -> URL? {
        guard let data = image.pngData() else { return nil }
        let url = FileManager.default.temporaryDirectory
            .appendingPathComponent("swift-logo-\(UUID().uuidString).png")
        do {
            try data.write(to: url)
            return url
        } catch {
            print("write error:", error)
            return nil
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            // URL 공유
            ShareLink(item: websiteURL) {
                Label("Share Apple Developer", systemImage: "square.and.arrow.up")
            }

            // 텍스트 공유
            ShareLink(item: "SwiftUI is awesome!") {
                Text("Share Text")
            }

            // 이미지 공유: 임시 파일 URL로 공유
            if let imageURL = saveTempPNG(renderedImage) {
                ShareLink(
                    item: imageURL,
                    preview: SharePreview("Swift Logo", image: Image(uiImage: renderedImage))
                ) {
                    Text("Share Image (as File URL)")
                }
            }

            // 여러 항목(동일 타입만!)
            ShareLink(items: [websiteURL]) {
                Text("Share Multiple URLs")
            }
        }
        .padding()
        .navigationTitle("ShareLink Demo")
    }
}

#Preview {
    ShareLinkDemoView()
}

