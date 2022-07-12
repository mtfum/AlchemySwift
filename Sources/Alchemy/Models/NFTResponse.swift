//
//  NFTResponse.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation

// MARK: - Response
public struct NFTResponse: Codable {
  public let ownedNfts: [NFT]
  public let totalCount: Int
  public let blockHash: String
}
