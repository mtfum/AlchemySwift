//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/03.
//

import Foundation

struct GetNFTMetadata: RequestType {

  typealias Response = NFT

  var apiType: AlchemyAPIType { .nft }
  var path: String { "getNFTMetadata" }
  var method: HTTPMethod { .GET }
  var queryItems: [URLQueryItem]

  init(
    contractAddress: String,
    tokenId: Int,
    tokenType: NFTTokenType?
  ) {
    queryItems = [
      .init(name: "contractAddress", value: contractAddress),
      .init(name: "tokenId", value: String(tokenId)),

    ]
    if let type = tokenType?.rawValue {
      queryItems.append(.init(name: "tokenType", value: type))
    }
  }
}

extension AlchemyClient {
  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getnftmetadata
  ///
  public func getNFTMetadata(
    contractAddress: String,
    tokenId: Int,
    tokenType: NFTTokenType? = nil
  ) async throws -> NFT {
    try await request(GetNFTMetadata(contractAddress: contractAddress, tokenId: tokenId, tokenType: tokenType))
  }
}
