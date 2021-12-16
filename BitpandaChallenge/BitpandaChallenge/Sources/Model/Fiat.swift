//
//  Fiat.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 15.12.21.
//

import Foundation

struct Fiat {

    let type: AssetType = .fiat
    let icon: URL?
    let name: String
    let symbol: String
}

extension Fiat: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let attributes = try container.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)
        name = try attributes.decode(String.self, forKey: .name)
        symbol = try attributes.decode(String.self, forKey: .symbol)
        let iconString = try attributes.decode(String.self, forKey: .icon)
        icon = URL(string: iconString)
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case attributes
    }

    private enum AttributesCodingKeys: String, CodingKey {
        case symbol
        case icon = "logo"
        case name
    }
}
