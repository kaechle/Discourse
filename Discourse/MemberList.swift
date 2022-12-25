//

import SwiftUI

class ServerMembers: ObservableObject {
  @Published var serverMembers = [Member]()
}

struct MemberGroups: Codable, Identifiable {
  var id: UUID
  var status: String
  var members: [Member]
}

struct Member: Codable, Hashable, Identifiable {
  var id: UUID
  var name: String
  var image: String
}

