//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/03.
//

import Foundation

struct URLBuilder {
  let type: AlchemyAPIType

  init(type: AlchemyAPIType) {
    self.type = type
  }

  func build(network: Network, apiKey: String) -> URL {
    switch type {
    case .alchemy:
      return URL(string: "https://\(network.rawValue).g.alchemy.com/v2/\(apiKey)")!
    case .nft:
      return URL(string: "https://\(network.rawValue).g.alchemy.com/nft/v2/\(apiKey)")!
    case .ws:
      return URL(string: "wss://\(network.rawValue).g.alchemy.com/v2/\(apiKey)")!
    }
  }
}
