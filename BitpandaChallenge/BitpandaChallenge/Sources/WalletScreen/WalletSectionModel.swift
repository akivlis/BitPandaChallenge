//
//  WalletSectionModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 17.12.21.
//

import RxDataSources

enum WalletSectionCell {
    case wallet(WalletTableViewCellViewModel)
    case fiatWallet(FiatWalletTableViewCellViewModel)
}


enum WalletSectionModel {
    case wallets(items: [WalletSectionCell])
    case commodityWallets(items: [WalletSectionCell])
    case fiatWallets(items: [WalletSectionCell])


    var title: String {
        switch self {
        case .wallets:
            return "Wallets"
        case .commodityWallets:
            return "Commodity Wallets"
        case .fiatWallets:
            return "Fiat Wallets"
        }
    }
}

extension WalletSectionModel: SectionModelType {

    typealias Item = WalletSectionCell

    var items: [Item] {
        switch self {
        case let .wallets(items):
            return items
        case let .commodityWallets(items):
            return items
        case let .fiatWallets(items):
            return items
        }
    }

    init(original: Self, items: [Self.Item]) {
        switch original {
        case .wallets:
            self = .wallets(items: items)
        case .commodityWallets:
            self = .commodityWallets(items: items)
        case .fiatWallets:
            self = .fiatWallets(items: items)
        }
    }
}
