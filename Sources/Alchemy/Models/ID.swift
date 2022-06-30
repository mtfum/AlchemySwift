//
//  ID.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation

// MARK: - ID
public struct ID: Codable {
  public let tokenID: String
  public let tokenMetadata: TokenMetadata

  enum CodingKeys: String, CodingKey {
    case tokenID = "tokenId"
    case tokenMetadata
  }
}
