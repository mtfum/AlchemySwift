import Foundation

public class AlchemyClient {

  private let config: Config
  private let session: URLSession
  private let decoder: JSONDecoder

  public init(config: Config, session: URLSession =  URLSession.shared, decoder: JSONDecoder = AlchemyClient.decoder) {
    self.config = config
    self.session = session
    self.decoder = decoder
  }

  func request<R: RequestType>(_ api: R) async throws -> R.Response {
    let urlRequest = api.build(with: config)
    let (data, _) = try await session.data(for: urlRequest)
    print(String(data: data, encoding: .utf8)!)
    return try decoder.decode(R.Response.self, from: data)
  }
}

extension AlchemyClient {

  public static let decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    return decoder
  }()

  public static var demo = AlchemyClient(config: .init(apiKey: "demo", network: .ethMainnet))
}
