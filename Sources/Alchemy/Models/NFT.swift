//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation

public struct NFT: Codable {
  public let contract: Contract
  public let id: ID
  public let title: String
  public let description: String
  public let tokenURI: TokenURI
  public let media: [TokenURI]
  public let metadata: Metadata
  public let timeLastUpdated: Date

  enum CodingKeys: String, CodingKey {
    case contract, id, title, description
    case tokenURI = "tokenUri"
    case media
    case metadata
    case timeLastUpdated
  }
}
