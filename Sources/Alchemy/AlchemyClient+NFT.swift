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
  ///
  public func getNFTMetadata(
    contractAddress: String,
    tokenId: Int,
    tokenType: NFTTokenType? = nil
  ) async throws -> NFT {
    try await request(GetNFTMetadata(contractAddress: contractAddress, tokenId: tokenId, tokenType: tokenType))
  }

  public func getContractMetadata(contractAddress: String) async throws -> ContractMetadata {
    try await request(GetContractMetadata(contractAddress: contractAddress)).contractMetadata
  }
}
