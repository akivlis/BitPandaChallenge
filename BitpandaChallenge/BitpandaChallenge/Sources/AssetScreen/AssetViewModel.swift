//
//  AssetViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import Foundation
import RxCocoa

struct AssetViewModel {

    private let assets: BehaviorRelay<[Asset]>
    private(set) lazy var items$ = self.assets
        .map {
            $0.map(AssetTableViewCellViewModel.init(asset:))
        }
        .asDriver(onErrorDriveWith: .never())

    // MARK: Properties


    // MARK: Init

    init(assets: [Asset]) {
        self.assets = BehaviorRelay(value: assets)
    }

}
