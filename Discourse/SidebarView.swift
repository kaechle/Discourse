//  Discourse, created by Tim Kaechle on 12/21/22.

import SwiftUI
import WebKit

struct SidebarView: View {
  @EnvironmentObject var channels: ServerChannels
  @State private var mainLink: URL = URL(string: "https://discord.com/channels/419336996117282816/419336996117282818")!
  
  public let channelList = Bundle.main.decode([ChannelGroups].self, from: "channels.json")
  
  var body: some View {
    List {
      ForEach(channelList) { group in
        Section(header: Text(group.name)
          .font(.system(size: 12, weight: .semibold, design: .rounded))
          .foregroundColor(.accentColor)
          .padding(.vertical, 12)
          .textCase(.uppercase)) {
            ForEach(group.channels) { channel in
              Group {
                if (channel.voice) {
                  VoiceChannel(linkName: channel.name)
                } else {
                  TextChannel(linkName: channel.name)
                }
              }
            }
          }
      }
    }
  }
}
  
  
  struct TextChannel: View {
    public var linkName: String
    var body: some View {
      HStack {
        Image(systemName: "number")
          .font(.system(size: 15, weight: .semibold, design: .rounded))
          .frame(alignment: .center)
          .opacity(0.7)
        NavigationLink(linkName, destination: self)
          .font(.system(size: 14, weight: .medium))
          .frame(alignment: .center)
      }
      .padding(.vertical, 2)
    }
  }
  
  struct VoiceChannel: View {
    public var linkName: String
    var body: some View {
      HStack {
        Image(systemName: "volume.2.fill")
          .font(.system(size: 14, weight: .semibold, design: .rounded))
          .frame(alignment: .center)
          .opacity(0.7)
        NavigationLink(linkName, destination: self)
          .font(.system(size: 14, weight: .medium))
          .frame(alignment: .center)
      }
      .padding(.vertical, 2)
    }
  }
