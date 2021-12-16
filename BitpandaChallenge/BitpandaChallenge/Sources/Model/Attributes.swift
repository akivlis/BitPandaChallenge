//
//  Attributes.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 15.12.21.
//

import Foundation

struct Attributes: Decodable {

    let cryptocoins: [Cryptocoin]
    let commodities: [Commodity]
    let fiats: [Fiat]
    let wallets: [Wallet]
    let commodityWallets: [Wallet]
    let fiatWallets: [FiatWallet]

    var assets: [Asset] {
        return cryptocoins + commodities + fiats
    }

    private enum CodingKeys: String, CodingKey {
        case cryptocoins
        case commodities
        case fiats
        case wallets
        case commodityWallets = "commodity_wallets"
        case fiatWallets = "fiatwallets"
    }
}

struct AttributesData: Decodable {
    let type: String
    let attributes: Attributes
}

struct MasterData: Decodable {
    let data: AttributesData
}


