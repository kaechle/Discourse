////  WebView.swift, created by Tim Kaechle on 12/19/22.
//
//import SwiftUI
//import WebKit
//
//struct MainView: View {
//  @State private var action = WebViewAction.load(URLRequest(url: URL(string: "https://discord.com/channels/419336996117282816/419336996117282818")!))
//  @State private var state = WebViewState.empty
//  @State private var address = "https://discord.com/channels/419336996117282816/419336996117282818"
//  @State private var memberList: Bool = true
//  @State private var searchText = ""
//  
//  private let textChannels = ["hardware", "newsinfotainment", "dabbin-til-dawn", "música", "shitposting"]
//  
//  var body: some View {
//    NavigationSplitView {
//      VStack() {
//        Button("#hardware") {
//          action = .evaluateJS(
//           """
//           setTimeout(() => {
//            document.querySelector("[aria-label='\(textChannels[0]) (text channel)']").click()
//           }, 1)
//           """, { (error) in
//             print(error)
//           })
//          action = .evaluateJS("document.querySelector('.sidebar-1tnWFu').style.display = 'none'", { (error) in
//            print(error)
//          })
//        }
//
//        Button("#newsinfotainment") {
//          action = .evaluateJS("""
//           setTimeout(() => {
//           document.querySelector("[aria-label='\(textChannels[1]) (text channel)']").click()
//           }, 1)
//           """, { (error) in
//            print(error)
//          })
//        }
//
//        Button("#dabbin-til-dawn") {
//          action = .evaluateJS("""
//           setTimeout(() => {
//           document.querySelector("[aria-label='\(textChannels[2]) (text channel)']").click()
//           }, 1)
//           """, { (error) in
//            print(error)
//          })
//        }
//
//        Button("#música") {
//          action = .evaluateJS("""
//           setTimeout(() => {
//           document.querySelector("[aria-label='\(textChannels[3]) (text channel)']").click()
//           }, 1)
//           """, { (error) in
//            print(error)
//          })
//        }
//
//        Button("#shitposting") {
//          action = .evaluateJS("""
//           setTimeout(() => {
//           document.querySelector("[aria-label='\(textChannels[4]) (text channel)']").click()
//           document.querySelector("[aria-label='\(textChannels[4]) (text channel)']").click()
//           }, 1)
//           """, { (error) in
//            print(error)
//          })
//        }
//      }
//    } detail: {
//      VStack {
//
//      }
//      .toolbar {
//        NavigationStack {
//          HStack {
//            Divider()
//            Text("Amazingly gigantic buttsechs")
//            Image(systemName: "message.badge.circle")
//            Image(systemName: "bell.and.waves.left.and.right")
//            Image(systemName: "pin")
//            Image(systemName: "person.2.fill")
//            Image(systemName: "newspaper")
//            navigationToolbar
//              .navigationTitle("#hardware")
//          }
////          .searchable(text: $searchText)
//        }
//      }
//    }
//  }
//    
//  private var navigationToolbar: some View {
//    HStack(spacing: 10) {
//      Button("Member List") {
//        if (memberList == true) {
//          action = .evaluateJS("document.querySelector('.container-2o3qEW').style.display = 'none'", { (error) in
//            print(error)
//          })
//          memberList = false
//        } else {
//          action = .evaluateJS("document.querySelector('.container-2o3qEW').style.display = ''", { (error) in
//            print(error)
//          })
//          memberList = true
//        }
//      }
//    }
//  }
//  
//  private var errorView: some View {
//    Group {
//      if let error = state.error {
//        Text(error.localizedDescription)
//          .foregroundColor(.red)
//      }
//    }
//  }
//}
