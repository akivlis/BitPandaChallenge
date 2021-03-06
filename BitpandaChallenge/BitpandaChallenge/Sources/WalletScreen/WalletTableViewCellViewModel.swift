//
//  WalletTableViewCellViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import Foundation
import UIKit

struct WalletTableViewCellViewModel {

    // MARK: - Properties

    let wallet: Wallet
    let icons: Icons?

    var title: String {
        return wallet.name
    }

    var balance: String? {
        return String(wallet.balance)
    }

    var symbol: String {
        return wallet.cryptocoinSymbol
    }

    var backgroundColor: UIColor {
        if wallet.isDefault {
            return UIColor.systemCyan.withAlphaComponent(0.1)
        }
        return UIColor.systemCyan.withAlphaComponent(0.3)
    }
}
