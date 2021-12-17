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
            .map { WalletSectionCell.wallet(WalletTableViewCellViewModel(wallet: $0)) }
        sections.append( WalletSectionModel.wallets(items: walletItems))

        // commodityWallets
        let commodityWalletItems = attributes.commodityWallets
            .map { WalletSectionCell.wallet(WalletTableViewCellViewModel(wallet: $0)) }
        sections.append(WalletSectionModel.commodityWallets(items: commodityWalletItems))

        // fiatWallets
        let fiatWalletItems = attributes.fiatWallets
            .map { WalletSectionCell.fiatWallet(FiatWalletTableViewCellViewModel(fiatWallet: $0)) }
        sections.append( WalletSectionModel.fiatWallets(items: fiatWalletItems))

        items.accept(sections)
    }

}
