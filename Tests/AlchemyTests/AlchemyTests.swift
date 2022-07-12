import XCTest
@testable import Alchemy

final class AlchemyTests: XCTestCase {
  let client = AlchemyClient.demo

  func testGetNFTs() async throws {
    do {
      let ownerAddr = "0xD563bb51ff55EFf701569b9aBE6F8F188BDC25Ff";
      let response = try await client.getNFTs(wallet: ownerAddr)
      XCTAssertTrue(!response.ownedNfts.isEmpty)
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
      let response = try await client.getContractMetadata(contractAddress: address)
      print(response)
      XCTAssertTrue(response.contractMetadata.name == "CyborgMercenariesCm")
      XCTAssertTrue(response.address == address)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testGetNFTsForCollectionWithMetadata() async throws {
    do {
      let address = "0x61fce80d72363b731425c3a2a46a1a5fed9814b2"
      let response = try await client.getNFTsForCollectionWithMetadata(contractAddress: address)
      print(response)
      XCTAssertFalse(response.nfts.isEmpty)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testGetFloorPrice() async throws {
    do {
      let address = "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d"
      let response = try await client.getFloorPrice(contractAddress: address)
      XCTAssertTrue(response.openSea.priceCurrency == "ETH")
      XCTAssertTrue(response.looksRare.priceCurrency == "ETH")
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testGetOwnersForCollection() async throws {
    do {
      let address = "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d"
      let owners = try await client.getOwnersForCollection(contractAddress: address)
      XCTAssertFalse(owners.isEmpty)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testGetOwnersForToken() async throws {
    do {
      let address = "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d"
      let tokenId = "867"
      let owners = try await client.getOwnersForToken(contractAddress: address, tokenId: tokenId)
      XCTAssertFalse(owners.isEmpty)

    } catch {
      XCTFail(String(describing: error))
    }
  }


  func testGetSpamContracts() async throws {
    do {
      let addresses = try await client.getSpamContracts()
      XCTAssertFalse(addresses.isEmpty)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testIsSpamContract() async throws {
    do {
      let address = "0x000440f08436a7b866d1ae42db5e0be801da722a"
      let isSpam = try await client.isSpamContract(contractAddress: address)
      XCTAssertTrue(isSpam)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testReingestContract() async throws {
    do {
      let address = "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d"
      let response = try await client.reingestContract(contractAddress: address)
      XCTAssertTrue(response.contractAddress == address)
      XCTAssertTrue(response.progress == 0)
    } catch {
      XCTFail(String(describing: error))
    }
  }
}
