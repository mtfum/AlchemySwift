//
//  GetContractMetadata.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

public struct GetContractMetadataResponse: Decodable {
  let address: String
  let contractMetadata: ContractMetadata
}

struct GetContractMetadata: RequestType {
  typealias Response = GetContractMetadataResponse

  var apiType: AlchemyAPIType { .nft }
  var path: String { "getContractMetadata" }
  var method: HTTPMethod { .GET }
  let queryItems: [URLQueryItem]

  init(contractAddress: String) {
    queryItems = [.init(name: "contractAddress", value: contractAddress)]
  }
}
