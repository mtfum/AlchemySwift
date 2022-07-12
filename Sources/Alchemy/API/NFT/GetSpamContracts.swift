//
//  GetSpamContracts.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

struct GetSpamContracts: RequestType {
  typealias Response = [String]

  var apiType: AlchemyAPIType { .nft }
  var path: String { "getSpamContracts" }
  var method: HTTPMethod { .GET }
}
