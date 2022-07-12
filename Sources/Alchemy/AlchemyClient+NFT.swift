//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/11.
//

import Foundation

extension AlchemyClient {
  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getnfts
  public func getNFTs(wallet: String) async throws -> NFTResponse {
    try await request(GetNFTs(wallet: wallet))
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getnftmetadata
  public func getNFTMetadata(
    contractAddress: String,
    tokenId: Int,
    tokenType: NFTTokenType? = nil
  ) async throws -> NFT {
    try await request(GetNFTMetadata(contractAddress: contractAddress, tokenId: tokenId, tokenType: tokenType))
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getcontractmetadata
  public func getContractMetadata(contractAddress: String) async throws -> GetContractMetadataResponse {
    try await request(GetContractMetadata(contractAddress: contractAddress))
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getnftsforcollection
  public func getNFTsForCollectionWithMetadata(
    contractAddress: String,
    tokenId: String? = nil,
    startToken: String? = nil,
    limit: Int? = nil
  ) async throws -> GetNFTsForCollectionResponse {
    try await request(GetNFTsForCollection(
      contractAddress: contractAddress,
      tokenId: tokenId,
      withMetadata: true,
      startToken: startToken,
      limit: limit
    ))
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getfloorprice
  public func getFloorPrice(contractAddress: String) async throws -> GetFloorPriceResponse {
    try await request(GetFloorPrice(contractAddress: contractAddress))
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getownersforcollection
  public func getOwnersForCollection(contractAddress: String) async throws -> [String] {
    try await request(GetOwnersForCollection(contractAddress: contractAddress)).ownerAddresses
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getOwnersForToken
  public func getOwnersForToken(contractAddress: String, tokenId: String) async throws -> [String] {
    try await request(GetOwnersForToken(contractAddress: contractAddress, tokenId: tokenId)).owners
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getSpamContracts
  public func getSpamContracts() async throws -> [String] {
    try await request(GetSpamContracts())
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/isSpamContract
  public func isSpamContract(contractAddress: String) async throws -> Bool {
    try await request(IsSpamContract(contractAddress: contractAddress))
  }

  /// https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/reingestcontract
  public func reingestContract(contractAddress: String) async throws -> ReingestContractResponse {
    try await request(ReingestContract(contractAddress: contractAddress))
  }
}
