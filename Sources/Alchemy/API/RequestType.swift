//
//  Request.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/06/30.
//

import Foundation

public protocol RequestType {
  var baseURL: URL { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var queryItems: [URLQueryItem] { get }
  var httpBody: Data? { get }
  var headerFields: [String: String] { get }
  associatedtype Response: Decodable
}

public extension RequestType {
  var baseURL: URL { URL(string: "https://eth-mainnet.alchemyapi.io/")! }

  var queryItems: [URLQueryItem] { [] }
  var httpBody: Data? { nil }

  var headerFields: [String: String] {
    [
      "Content-Type": "application/json"
    ]
  }
}

extension RequestType {
  func build(with key: String) -> URLRequest {
    let url = baseURL.appendingPathComponent(path)
    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    urlComponents.queryItems = queryItems
    var request = URLRequest(url: urlComponents.url!)

    var headerFields = self.headerFields
    headerFields["X-API-KEY"] = key
    request.allHTTPHeaderFields = headerFields
    request.httpMethod = method.rawValue
    request.httpBody = httpBody
    return request
  }
}
