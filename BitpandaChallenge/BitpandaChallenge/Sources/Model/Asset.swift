//
//  Asset.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 15.12.21.
//

import Foundation

protocol Asset {

    var type: AssetType { get }

    var icon: URL? { get }

    var name: String { get }

    var symbol: String { get }

    var averagePrice: String? { get }
}

extension Asset {
    var averagePrice: String? {
        return nil
    }
}

enum AssetType: String,  Codable, CaseIterable {
    case cryptocoin, commodity, fiat
}
