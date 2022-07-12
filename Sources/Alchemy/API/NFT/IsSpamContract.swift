//
//  IsSpamContract.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

struct IsSpamContract: RequestType {
  typealias Response = Bool

  var apiType: AlchemyAPIType { .nft }
  var path: String { "isSpamContract" }
  var method: HTTPMethod { .GET }
  let queryItems: [URLQueryItem]

  init(contractAddress: String) {
    queryItems = [.init(name: "contractAddress", value: contractAddress)]
  }
}
