//  Discourse, created by Tim Kaechle on 12/19/22.

import SwiftUI
import WebKit

struct ServerControl: View {
  public var serverName: String = "#hardware"
  
  var body: some View {
    HStack {
      Text(serverName)
        .font(.title2)
        .fontWeight(.medium)
    }
  }
}

struct ChannelControl: View {
  var channelName: String = "hardware"
  var channelMessage: String = "i dont know shit about fuck. — w00t69 (2022)"
  
  var body: some View {
    HStack {
      Image(systemName: "number")
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .frame(alignment: .center)
        .opacity(0.7)
      Text(channelName)
        .font(.system(size: 17, weight: .medium))
        .frame(alignment: .center)
      Divider()
        .background(Color.gray)
        .opacity(0.4)
        .frame(height: 24, alignment: .center)
        .ignoresSafeArea()
      Text(channelMessage)
        .font(.system(size: 13, weight: .medium))
        .frame(alignment: .center)
    }
    .padding(.bottom, 2)
  }
}

struct ToolbarButtons: View {
  @Binding var hideMemberList: Bool
  
  func toggleMemberList() {
    if (hideMemberList) {
      hideMemberList.toggle()
    }
  }
  
  var body: some View {
    HStack {
      Button(
        action: {
          toolbarAction(title: "Poke, poke.", message: "You pressed a button. Congrats")
        },
        label: {
          Image(systemName: "quote.bubble.fill.rtl")
        }
      )
      
      Button(
        action: {
          toolbarAction(title: "Poke, poke.", message: "You pressed a button. Congrats")
        },
        label: {
          Image(systemName: "bell.slash.fill")
        }
      )
      
      Button(
        action: {
          toolbarAction(title: "Poke, poke.", message: "You pressed a button. Congrats")
        },
        label: {
          Image(systemName: "pin.fill")
        }
      )
      
      Button(
        action: {
          withAnimation(.easeOut(duration: 0.15)) {
            hideMemberList.toggle()
          }
        },
        label: {
          Image(systemName: "person.and.person.fill")
        }
      )
    }
  }
}

