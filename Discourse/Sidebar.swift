import SwiftUI

class ServerChannels: ObservableObject {
  @Published var channels = [Channel]()
}

struct ChannelGroups: Codable, Identifiable {
  var id: UUID
  var name: String
  var channels: [Channel]
}

struct Channel: Codable, Hashable, Identifiable {
  var id: UUID
  var name: String
  var voice: Bool
}
