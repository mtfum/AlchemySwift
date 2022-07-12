//
//  GetOwnersForCollection.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

struct GetOwnersForCollection: RequestType {
  struct Response: Decodable {
    let ownerAddresses: [String]
  }

  var apiType: AlchemyAPIType { .nft }
  var path: String { "getOwnersForCollection" }
  var method: HTTPMethod { .GET }
  let queryItems: [URLQueryItem]

  init(contractAddress: String) {
    queryItems = [.init(name: "contractAddress", value: contractAddress)]
  }
}
