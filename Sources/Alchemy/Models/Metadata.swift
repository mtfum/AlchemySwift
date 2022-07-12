//
//  Metadata.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/29.
//

import Foundation

// MARK: - Metadata
public struct Metadata: Codable {
  public let name: String?
  public let description: String?
  public let image: String?
  public let externalUrl: String?
  public let attributes: [Attribute]?

  enum CodingKeys: String, CodingKey {
    case name
    case description
    case image
    case externalUrl = "external_url"
    case attributes
  }
}
