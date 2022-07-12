//
//  ReingestContract.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

public enum ReingestionState: String, Decodable {
  case doesNotExist = "does_not_exist"
  case alreadyQueried = "already_queried"
  case inProgress = "in_progress"
  case finished
  case queued
  case euqueFailed = "euque_failed"
}

public struct ReingestContractResponse: Decodable {
  let contractAddress: String
  let reingestionState: ReingestionState
  let progress: Float?
}

struct ReingestContract: RequestType {
typealias Response = ReingestContractResponse

  var apiType: AlchemyAPIType { .nft }
  var path: String { "reingestContract" }
  var method: HTTPMethod { .GET }
  let queryItems: [URLQueryItem]

  init(contractAddress: String) {
    queryItems = [.init(name: "contractAddress", value: contractAddress)]
  }
}
