//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

public struct GetNFTsForCollectionResponse:  Decodable {
  let nfts: [NFT]
  let nextToken: String
}

struct GetNFTsForCollection: RequestType {
  typealias Response = GetNFTsForCollectionResponse

  var apiType: AlchemyAPIType { .nft }
  var path: String { "getNFTsForCollection" }
  var method: HTTPMethod { .GET }
  var queryItems: [URLQueryItem]

  init(
    contractAddress: String,
    tokenId: String?,
    withMetadata: Bool?,
    startToken: String?,
    limit: Int?
  ) {
    queryItems = [.init(name: "contractAddress", value: contractAddress)]
    if let tokenId = tokenId {
      queryItems.append(.init(name: "tokenId", value: tokenId))
    }
    if let withMetadata = withMetadata {
      queryItems.append(.init(name: "withMetadata", value: withMetadata ? "true" : "false"))
    }
    if let startToken = startToken {
      queryItems.append(.init(name: "startToken", value: startToken))
    }
    if let limit = limit {
      queryItems.append(.init(name: "limit", value: String(limit)))
    }
  }
}
