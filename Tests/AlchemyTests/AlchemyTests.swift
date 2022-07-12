import XCTest
@testable import Alchemy

final class AlchemyTests: XCTestCase {
  let client = AlchemyClient.demo

  func testGetNFTs() async throws {
    do {
      let ownerAddr = "0xD563bb51ff55EFf701569b9aBE6F8F188BDC25Ff";
      let response = try await client.getNFTs(wallet: ownerAddr)
      XCTAssertTrue(!response.ownedNFTs.isEmpty)
      XCTAssertTrue(response.totalCount != 0)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testGetNFTMetadata() async throws {
    do {
      let address = "0x5180db8f5c931aae63c74266b211f580155ecac8"
      let nft = try await client.getNFTMetadata(contractAddress: address, tokenId: 1590)
      XCTAssertTrue(nft.contract.address == address)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testGetContractMetadata() async throws {
    do {
      let address = "0x61fce80d72363b731425c3a2a46a1a5fed9814b2"
      let contractMetadata = try await client.getContractMetadata(contractAddress: address)
      XCTAssertTrue(contractMetadata.name == "CyborgMercenariesCm")
    } catch {
      XCTFail(String(describing: error))
    }
  }
}
