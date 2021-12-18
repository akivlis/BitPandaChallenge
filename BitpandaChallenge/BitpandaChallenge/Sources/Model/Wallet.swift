//
//  Wallet.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import Foundation

struct Wallet {
    let name: String
    let balance: Float
    let cryptocoinId: String
    let cryptocoinSymbol: String
    let isDefault: Bool
    let isDeleted: Bool
}

// - MARK: Decodable

extension Wallet: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let attributes = try container.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)
        name = try attributes.decode(String.self, forKey: .name)
        let balanceString = try attributes.decode(String.self, forKey: .balance)
        balance = Float(balanceString) ?? 0.0
        cryptocoinId = try attributes.decode(String.self, forKey: .cryptocoinId)
        cryptocoinSymbol = try attributes.decode(String.self, forKey: .cryptocoinSymbol)
        isDefault = try attributes.decode(Bool.self, forKey: .isDefault)
        isDeleted = try attributes.decode(Bool.self, forKey: .isDeleted)
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case attributes
    }

    private enum AttributesCodingKeys: String, CodingKey {
        case name
        case balance
        case cryptocoinSymbol = "cryptocoin_symbol"
        case cryptocoinId = "cryptocoin_id"
        case isDefault = "is_default"
        case isDeleted = "deleted"
    }
}





