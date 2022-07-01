import XCTest
@testable import Alchemy

final class AlchemyTests: XCTestCase {
  let client = AlchemyClient(apiKey: "Hc09LS0s4CwG2VMTwQz086hcaVpc3n5O")

  func testFetchAssets() async throws {
    do {
      let ownerAddr = "0xD563bb51ff55EFf701569b9aBE6F8F188BDC25Ff";
      let response = try await client.getNFTs(wallet: ownerAddr)
      debugPrint(response)
      XCTAssertTrue(!response.ownedNFTs.isEmpty)
      XCTAssertTrue(response.totalCount != 0)
    } catch {
      XCTFail(String(describing: error))
    }
  }
}
