//  Discourse, created by Tim Kaechle on 12/19/22.

import SwiftUI
import WebKit

struct ContentView: View {
  @State var hideMemberList = true
  @State var selectedChannel = 0
  
  var body: some View {
    NavigationSplitView {
      SidebarView()
        .environmentObject(ServerChannels())
        .navigationSplitViewColumnWidth(min: 200, ideal: 240, max: 340)
    } detail: {
      HStack {
        VStack {
          DiscordView()
        }
        VStack {
          if (hideMemberList) {
            MemberListView()
              .transition(.backslide)
              .frame(maxWidth: 220, alignment: .top)
              .padding(-10)
          }
        }
      }
    }
    .toolbar {
      ToolbarItem(placement: ToolbarItemPlacement.navigation) {
        ChannelControl()
      }
      ToolbarItem(placement: ToolbarItemPlacement.automatic) {
        Spacer()
      }
      ToolbarItem(placement: ToolbarItemPlacement.automatic) {
        ToolbarButtons(hideMemberList: $hideMemberList)
      }
    }
  }
}

extension AnyTransition {
  static var backslide: AnyTransition {
    AnyTransition.asymmetric(
      insertion: .move(edge: .trailing),
      removal: .move(edge: .trailing)
    )
  }
}
