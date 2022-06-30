//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation

// MARK: - OwnedNft
public struct OwnedNFT: Codable {
  public let contract: Contract
  public let id: ID
  public let title, ownedNftDescription: String
  public let tokenURI: TokenURI
  public let media: [TokenURI]
  public let metadata: Metadata
  public let timeLastUpdated: String

  enum CodingKeys: String, CodingKey {
    case contract, id, title
    case ownedNftDescription = "description"
    case tokenURI = "tokenUri"
    case media
    case metadata
    case timeLastUpdated
  }
}
