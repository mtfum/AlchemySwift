import Foundation

private let baseURL = "https://eth-mainnet.alchemyapi.io/nft/v2/demo/getNFTs/";

public enum APIError: Error {
  case url
  case request
}

public struct Alchemy {
  private let apiKey: String
  private let session: URLSession
  private let decoder: JSONDecoder

  public init(apiKey: String, session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
    self.apiKey = apiKey
    self.session = session
    self.decoder = decoder
  }

  public func fetchAssets(of wallet: String, _ cursor: String = "") async throws -> Response {
    let fetchURL = "\(baseURL)?owner=\(wallet)"
    guard let url = URL(string: fetchURL) else {
      throw APIError.url
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = [
      "Accept": "application/json",
      "X-API-KEY": apiKey
    ]
    guard let url = request.url else {
      throw APIError.request
    }

    let (data, response) = try await session.data(from: url)
    return try decoder.decode(Response.self, from: data)
  }
}
