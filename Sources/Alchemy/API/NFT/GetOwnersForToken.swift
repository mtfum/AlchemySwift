//
//  GetOwnersForToken.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

struct GetOwnersForToken: RequestType {
  struct Response: Decodable {
    let owners: [String]
  }

  var apiType: AlchemyAPIType { .nft }
  var path: String { "getOwnersForToken" }
  var method: HTTPMethod { .GET }
  let queryItems: [URLQueryItem]

  init(contractAddress: String, tokenId: String) {
    queryItems = [
      .init(name: "contractAddress", value: contractAddress),
      .init(name: "tokenId", value: tokenId)
    ]
  }
}
