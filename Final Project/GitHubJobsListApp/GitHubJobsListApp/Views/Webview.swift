//
//  Webview.swift
//  GitHubJobsListApp
//
//  Created by lapedro.veloso on 12/02/21.
//

import Foundation
import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    
    var content: String
    
    func makeUIView(context: Context) -> WKWebView {

        let webview = WKWebView()
        webview.loadHTMLString(content.fixingHeaderToAdjustFontSize, baseURL: nil)
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
}

private extension String {
    var fixingHeaderToAdjustFontSize: String {
        var htmlHeader = "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0'></header>"
        htmlHeader.append(self)
        print(htmlHeader)
        return htmlHeader
    }
}
