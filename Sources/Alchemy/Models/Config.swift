//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/02.
//

import Foundation

public struct Config {
  public let apiKey: String
  public let network: Network
  public let maxRetries: Int?

  public init(apiKey: String, network: Network, maxRetries: Int? = nil) {
    self.apiKey = apiKey
    self.network = network
    self.maxRetries = maxRetries
  }
}

