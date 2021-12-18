//
//  Commodity.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 15.12.21.
//

import Foundation

struct Commodity {

    let type: AssetType = .commodity
    let id: String
    let icons: Icons
    let name: String
    let symbol: String
    let averagePrice: String?
}

// - MARK: Asset

extension Commodity: Asset {}

// - MARK: Decodable

extension Commodity: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        let attributes = try container.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)
        name = try attributes.decode(String.self, forKey: .name)
        symbol = try attributes.decode(String.self, forKey: .symbol)
        averagePrice = try attributes.decode(String.self, forKey: .averagePrice)
        let iconString = try attributes.decode(String.self, forKey: .icon)
        let icon = URL(string: iconString)
        let darkIconString = try attributes.decode(String.self, forKey: .darkIcon)
        let darkIcon = URL(string: darkIconString)
        icons = (icon, darkIcon)
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case attributes
        case id
    }

    private enum AttributesCodingKeys: String, CodingKey {
        case symbol
        case icon = "logo"
        case darkIcon = "logo_dark"
        case name
        case averagePrice = "avg_price"
    }
}
