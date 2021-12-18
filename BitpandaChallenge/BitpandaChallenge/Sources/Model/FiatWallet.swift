//
//  FiatWallet.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import Foundation

struct FiatWallet {
    let name: String
    let balance: Float
    let fiatId: String
    let fiatSymbol: String
}

// - MARK: Decodable

extension FiatWallet: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let attributes = try container.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)
        name = try attributes.decode(String.self, forKey: .name)
        let balanceString = try attributes.decode(String.self, forKey: .balance)
        balance = Float(balanceString) ?? 0.0
        fiatId = try attributes.decode(String.self, forKey: .fiatId)
        fiatSymbol = try attributes.decode(String.self, forKey: .fiatSymbol)
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case attributes
    }

    private enum AttributesCodingKeys: String, CodingKey {
        case name
        case balance
        case fiatSymbol = "fiat_symbol"
        case fiatId = "fiat_id"
    }
}
