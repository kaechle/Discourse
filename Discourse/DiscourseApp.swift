//
//  DiscourseApp.swift
//  Discourse
//
//  Created by Tim Kaechle on 12/19/22.
//

import SwiftUI
import SwiftSoup

@available(macOS 13.0, *)
@main
struct DiscourseApp: App {
  public var home: URL? = URL(string: "https://discord.com/channels/419336996117282816/419336996117282818")
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .windowStyle(.hiddenTitleBar)
    .windowToolbarStyle(.unified)
  }
}

