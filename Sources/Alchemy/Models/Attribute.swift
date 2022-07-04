//
//  Attribute.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation
import AnyCodable

// MARK: - Attribute
public struct Attribute: Codable {
  public let traitType: String
  public let value: AnyCodable
  public let displayType: String?
  public let maxValue: AnyCodable?

  enum CodingKeys: String, CodingKey {
    case value
    case traitType = "trait_type"
    case displayType = "display_type"
    case maxValue = "max_value"
  }
}
