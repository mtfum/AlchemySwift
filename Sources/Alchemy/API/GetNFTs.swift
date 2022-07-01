//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/30.
//

import Foundation

public struct GetNFTs: RequestType {

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

  public var path: String { "nft/v2/demo/getNFTs/" }
  public var method: HTTPMethod { .get }
  public var queryItems: [URLQueryItem]

  public init(wallet: String) {
    self.queryItems = [
      .init(name: "owner", value: wallet)
    ]
  }
}
