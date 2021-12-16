//
//  AssetTableViewCellViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import Foundation

struct AssetTableViewCellViewModel {

    let asset: Asset

    var iconURL: URL? {
        return asset.icon
    }

    var title: String {
        return asset.name
    }

    var symbol: String {
        return asset.symbol.uppercased()
    }

    var averagePrice: String {
        return asset.averagePrice ?? ""
    }

}
