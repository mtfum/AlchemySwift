import Foundation

public class Alchemy {

  private let apiKey: String
  private let session: URLSession
  private let decoder: JSONDecoder

  public init(apiKey: String, session: URLSession =  URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
    self.apiKey = apiKey
    self.session = session
    self.decoder = decoder
  }

  public func request<R: RequestType>(_ api: R) async throws -> R.Response {
    let urlRequest = api.build(with: apiKey)
    let (data, _) = try await session.data(for: urlRequest)
    return try decoder.decode(R.Response.self, from: data)
  }
}
