//
//  FiatWalletTableViewCellViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import Foundation

struct FiatWalletTableViewCellViewModel {

    // MARK: - Properties

    let fiatWallet: FiatWallet
    let icons: Icons?

    var title: String {
        return fiatWallet.name
    }

    var balance: String? {
        return String(fiatWallet.balance)
    }

    var symbol: String {
        return fiatWallet.fiatSymbol
    }
}
