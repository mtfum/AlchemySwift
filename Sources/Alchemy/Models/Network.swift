//
//  File.swift
//  
//
//  Created by Fumiya Yamanaka on 2022/07/02.
//

import Foundation

public enum Network {
  public enum Eth: String  {
    case mainnet = "eth-mainnet"
    case ropsten = "eth-ropsten"
    case goerli = "eth-goerli"
    case rinkeby = "eth-rinkeby"
  }
  public enum Opt: String {
    case mainnet = "opt-mainnet"
    case kovan = "opt-kovan"
  }
  public enum Arb: String {
    case mainnet = "arb-mainnet"
    case rinkeby = "arb-rinkeby"
  }
  public enum Matic: String {
    case mainnet = "polygon-mainnet"
    case mumbai = "polygon-mumbai"
  }

  case eth(Eth)
  case opt(Opt)
  case arb(Arb)
  case matic(Matic)
}
