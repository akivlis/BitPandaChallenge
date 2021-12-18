//
//  AssetViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import Foundation
import RxCocoa

struct AssetViewModel {

    private let filteredAssets: BehaviorRelay<[Asset]>
    private(set) lazy var items$ = self.filteredAssets
        .map {
            $0.map(AssetTableViewCellViewModel.init(asset:))
        }
        .asDriver(onErrorDriveWith: .never())

    // MARK: Properties

    private let allAssets: [Asset]

    // MARK: Init

    init(assets: [Asset]) {
        // remove fiats which have no wallets
        self.allAssets = assets.filter { $0.hasWallets }
        self.filteredAssets = BehaviorRelay(value: allAssets)
    }

    /// Filter for assets based on its type
    /// if type is nil, return all assets
    func filter(for assetType: AssetType?) {
        guard let assetType = assetType else {
            filteredAssets.accept(allAssets)
            return
        }
        let newAssets = allAssets.filter { $0.type == assetType }
        filteredAssets.accept(newAssets)
    }
}
