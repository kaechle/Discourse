//  Discourse, created by Tim Kaechle on 12/21/22.

import SwiftUI
struct MemberListView: View {
  @EnvironmentObject var members: ServerMembers
  
  let memberList = Bundle.main.decode([MemberGroups].self, from: "members.json")
  
  var body: some View {
    List {
      ForEach(memberList) { member in
        Section(header: Text(member.status)
          .frame(maxWidth: .infinity)
          .font(.system(size: 12, weight: .semibold, design: .rounded))
          .foregroundColor(.accentColor)
          .textCase(.uppercase)
        ) {
          ForEach(member.members) { member in
            MemberLink(linkName: member.name)
          }
        }
      }
    }
    .listStyle(.sidebar)
  }
}

struct MemberLink: View {
  public var linkName: String
  var body: some View {
    HStack {
      Image(systemName: "circle.fill")
        .font(.system(size: 32))
        .frame(alignment: .center)
      NavigationLink(linkName, destination: self)
        .font(.system(size: 14, weight: .medium))
        .frame(alignment: .center)
    }
    .padding(.vertical, 2)
  }
}
