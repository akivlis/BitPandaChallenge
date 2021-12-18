//
//  WalletViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import Foundation
import RxRelay
import RxCocoa

class WalletViewModel {

    // MARK: Properties

    var attributes: Attributes? {
        didSet {
            calculateSections(from: attributes)
        }
    }

    private var items = BehaviorRelay<[WalletSectionModel]>(value: [WalletSectionModel]())
    private(set) lazy var items$: Driver<[WalletSectionModel]> = items.asDriver(onErrorDriveWith: .never())

    // MARK: Init

    init(attributes: Attributes? = nil) {
        self.attributes = attributes
    }

    private func calculateSections(from attributes: Attributes? = nil) {
        var sections = [WalletSectionModel]()

        guard let attributes = attributes else {
            items.accept(sections)
            return
        }

        // wallets
        let walletItems = attributes.wallets
            .filter { !$0.isDeleted }
            .sorted { $0.balance > $1.balance }
            .map { wallet  -> (Wallet, Icons?) in
                let crypto =  attributes.cryptocoins.first { $0.id == wallet.cryptocoinId }
                return (wallet, crypto?.icons)
            }
            .map { WalletSectionCell.wallet(WalletTableViewCellViewModel(wallet: $0.0, icons: $0.1)) }
        sections.append( WalletSectionModel.wallets(items: walletItems))

        // commodityWallet
        let commodityWalletItems = attributes.commodityWallets
            .filter { !$0.isDeleted }
            .sorted { $0.balance > $1.balance }
            .map { wallet  -> (Wallet, Icons?) in
                let commodity =  attributes.commodities.first { $0.id == wallet.cryptocoinId }
                return (wallet, commodity?.icons)
            }
            .map { WalletSectionCell.wallet(WalletTableViewCellViewModel(wallet: $0.0, icons: $0.1)) }
        sections.append(WalletSectionModel.commodityWallets(items: commodityWalletItems))

        // fiatWallets
        let fiatWalletItems = attributes.fiatWallets
            .sorted { $0.balance > $1.balance }
            .map { wallet  -> (FiatWallet, Icons?) in
                let fiat =  attributes.fiats.first { $0.id == wallet.fiatId }
                return (wallet, fiat?.icons)
            }
            .map { WalletSectionCell.fiatWallet(FiatWalletTableViewCellViewModel(fiatWallet: $0.0, icons: $0.1)) }
        sections.append( WalletSectionModel.fiatWallets(items: fiatWalletItems))

        items.accept(sections)
    }

}
