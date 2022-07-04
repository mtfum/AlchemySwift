//
//  GetNFTs.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/30.
//

import Foundation

struct GetNFTs: RequestType {
  typealias Response = NFTResponse

  var apiType: AlchemyAPIType { .nft }
  var path: String { "getNFTs" }
  var method: HTTPMethod { .GET }
  var queryItems: [URLQueryItem]

  init(wallet: String) {
    queryItems = [.init(name: "owner", value: wallet)]
  }
}

extension AlchemyClient {
  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getnfts
  public func getNFTs(wallet: String) async throws -> NFTResponse {
    try await request(GetNFTs(wallet: wallet))
  }
}
