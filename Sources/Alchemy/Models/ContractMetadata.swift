//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

public struct ContractMetadata: Decodable {
  public let name: String
  public let symbol: String
  public let totalSupply: String
  public let tokenType: String
}
