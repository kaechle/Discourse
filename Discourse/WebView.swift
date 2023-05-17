//  Discourse, created by Tim Kaechle on 12/21/22.

import SwiftUI
import WebKit
import Combine

struct DiscordView: View {
  var body: some View {
    WebView(data: WebViewData())
  }
}

class WebViewData: ObservableObject {
  @Published var loading: Bool = false
  @Published var url: URL? = URL(string: "https://discord.com/channels/419336996117282816/419336996117282818")
  //  @Published var url: URL? = URL(string: "http://localhost:8080")
  
  init() {
    self.url = url
  }
}

struct WebView: NSViewRepresentable {
  @ObservedObject var data: WebViewData
  var webView: WKWebView = WKWebView()
  
  func makeNSView(context: Context) -> WKWebView {
    return context.coordinator.webView
  }
  
  func updateNSView(_ nsView: WKWebView, context: Context) {
    guard context.coordinator.loadedUrl != data.url else { return }
    context.coordinator.loadedUrl = data.url
    
    if let url = data.url {
      DispatchQueue.main.async {
        let request = URLRequest(url: url)
        DispatchQueue.main.async {
          nsView.load(request)
        }
      }
    }
  }
  
  func makeCoordinator() -> WebViewCoordinator {
    return WebViewCoordinator(data: data)
  }
}

func toolbarAction(title: String, message: String) {
  let alert: NSAlert = NSAlert()
  alert.messageText = title
  alert.informativeText = message
  alert.alertStyle = .warning
  alert.runModal()
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
  @ObservedObject var data: WebViewData
  
  var webView: WKWebView = WKWebView()
  var loadedUrl: URL? = nil
  var loadedNav: String? = nil
  
  init(data: WebViewData) {
    self.data = data
    super.init()
    webView.navigationDelegate = self
    webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 12_5_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15"
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
      let hideElements =  """
                          document.querySelector("[aria-label='Servers sidebar']").style.display = 'none'
                          document.querySelector(".sidebar-1tnWFu").style.display = 'none'
                          document.querySelector("[aria-label='Channel header']").style.display = 'none'
                          document.querySelector(".container-2o3qEW").style.display = 'none'
                          """
      
      webView.evaluateJavaScript(hideElements, completionHandler: nil)
      self.data.loading = false
    }
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    showError(title: "Navigation Error", message: error.localizedDescription)
    DispatchQueue.main.async { self.data.loading = false }
  }
  
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    showError(title: "Loading Error", message: error.localizedDescription)
    DispatchQueue.main.async { self.data.loading = false }
  }
  
  func showError(title: String, message: String) {
#if os(macOS)
    let alert: NSAlert = NSAlert()
    
    alert.messageText = title
    alert.informativeText = message
    alert.alertStyle = .warning
    alert.runModal()
#else
    print("\(title): \(message)")
#endif
  }
}
