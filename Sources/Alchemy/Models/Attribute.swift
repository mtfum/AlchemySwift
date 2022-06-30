//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation

// MARK: - Attribute
public struct Attribute: Codable {
  public let value: String
  public let traitType: String

  enum CodingKeys: String, CodingKey {
    case value
    case traitType = "trait_type"
  }
}
