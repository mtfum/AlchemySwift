//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

public struct MarketPlace: Decodable {
  public let floorPrice: Float
  public let priceCurrency: String
  public let retrievedAt: Date
  public let collectionUrl: String
}

public struct GetFloorPriceResponse: Decodable {
  let openSea: MarketPlace
  let looksRare: MarketPlace
}

struct GetFloorPrice: RequestType {
  typealias Response = GetFloorPriceResponse

  var apiType: AlchemyAPIType { .nft }
  var path: String { "getFloorPrice" }
  var method: HTTPMethod { .GET }
  let queryItems: [URLQueryItem]

  init(contractAddress: String) {
    queryItems = [.init(name: "contractAddress", value: contractAddress)]
  }
}
