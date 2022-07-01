//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/30.
//

import Foundation

struct GetNFTs: RequestType {

  typealias Response = NFTResponse

  var path: String { "nft/v2/demo/getNFTs/" }
  var method: HTTPMethod { .get }
  var queryItems: [URLQueryItem]

  init(wallet: String) {
    queryItems = [
      .init(name: "owner", value: wallet)
    ]
  }
}

extension AlchemyClient {
  public func getNFTs(wallet: String) async throws -> NFTResponse {
    try await request(GetNFTs(wallet: wallet))
  }
}
