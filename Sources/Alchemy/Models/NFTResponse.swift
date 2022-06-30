//
//  NFTResponse.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation

// MARK: - Response
public struct Response: Codable {
  public let ownedNFTs: [OwnedNFT]
  public let totalCount: Int
  public let blockHash: String

  enum CodingKeys: String, CodingKey {
    case ownedNFTs = "ownedNfts"
    case totalCount
    case blockHash
  }
}
