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

    var symbol: URL? { get }

    var averagePrice: Double? { get }
}

enum AssetType: String,  Codable {
    case cryptocoin, commodity, fiat
}
