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

    var darkIconURL: URL? {
        return asset.darkIcon
    }

    var title: String {
        return asset.name
    }

    var symbol: String {
        return asset.symbol.uppercased()
    }

    var averagePrice: String? {
        guard let priceString = asset.averagePrice,
              let price = Float(priceString)
        else { return nil }
        let locale = Locale.current
        return formatPrice(price: price, inLocale: locale)
    }

     // MARK: - Private

    private func formatPrice(price: Float, inLocale locale: Locale) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: price))
    }

}
