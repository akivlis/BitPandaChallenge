//
//  Tab.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 08.12.21.
//

import UIKit

enum Tab: CaseIterable {
    case asset
    case wallet

    var title: String {
        switch self {
        case .asset:
            return "Asset"
        case .wallet:
            return "Wallet"
        }
    }

    var iconName: String {
        switch self {
        case .asset:
            return "chart.pie"
        case .wallet:
            return "wallet.pass"
        }
    }

    var viewControllerType: UIViewController.Type {
        switch self {
        case .asset:
            return AssetViewController.self
        case .wallet:
            return WalletViewController.self
        }
    }

    var tabBarItem: UITabBarItem {
        UITabBarItem(title: self.title, image: UIImage(systemName: self.iconName), tag: 0)
    }
}
