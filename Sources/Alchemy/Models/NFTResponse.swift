//
//  NFTResponse.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation

// MARK: - Response
public struct NFTResponse: Codable {
  public let ownedNFTs: [NFT]
  public let totalCount: Int
  public let blockHash: String

  enum CodingKeys: String, CodingKey {
    case ownedNFTs = "ownedNfts"
    case totalCount
    case blockHash
  }
}
