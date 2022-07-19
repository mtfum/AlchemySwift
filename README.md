# AlchemySwift

This is an open source library on pure swift for Alchemy.

This object is to increase developers to get into Web3.

## Features

### Enhanced APIs
- [x] NFT
- [ ] Transfer
- [ ] Transaction Receipt
- [ ] Token
- [ ] Notify
- [ ] Debug
- [ ] Subscription (Web Socket)
- [ ] Unstoppable Domains

### Chain APIs
- [ ] Ethreum
- [ ] Polygon
- [ ] Arbitrum
- [ ] Optimisim
- [ ] Solana



## How to use

### Initialization

```swift
  let config = Config(apiKey: "YOUR_API_KEY", network: .ethMainnet)
  let client = AlchemyClient(config: config)
```

### NFT

#### [GetNFTs](https://docs.alchemy.com/alchemy/enhanced-apis/nft-api/getnfts)

```swift
  let address = "0xD563bb51ff55EFf701569b9aBE6F8F188BDC25Ff";
  let response = try await client.getNFTs(wallet: address)
``` 

## Requirements

- iOS 15.0+ / macOS 12 / tvOS 15.0+ / watchOS 8.0+
- Swift 5.6+

## Installation

### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add https://github.com/mtfum/AlchemySwift
- Select brach with `main`
- Select Alchemy
