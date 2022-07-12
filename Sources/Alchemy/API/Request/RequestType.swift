//
//  Request.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/30.
//

import Foundation

protocol RequestType {
  associatedtype Response: Decodable
  var apiType: AlchemyAPIType { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var queryItems: [URLQueryItem] { get }
  var httpBody: Data? { get }
  var headerFields: [String: String] { get }
}

extension RequestType {
  var queryItems: [URLQueryItem] { [] }
  var httpBody: Data? { nil }

  var headerFields: [String: String] {
    [
      "Content-Type": "application/json"
    ]
  }
}

extension RequestType {
  func build(with config: Config) -> URLRequest {
    let url = URLBuilder(type: apiType)
      .build(network: config.network, apiKey: config.apiKey)
      .appendingPathComponent(path)

    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    urlComponents.queryItems = queryItems

    var request = URLRequest(url: urlComponents.url!)
    request.allHTTPHeaderFields = headerFields
    request.httpMethod = method.rawValue
    request.httpBody = httpBody

    return request
  }
}
