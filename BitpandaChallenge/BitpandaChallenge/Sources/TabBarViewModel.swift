//
//  TabBarViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 15.12.21.
//

import Foundation
import Combine

struct TabBarViewModel {

    private let assetsSubject = PassthroughSubject<[Asset], Never>()
    private(set) lazy var assetsPublisher = assetsSubject
        .eraseToAnyPublisher()

    func parseData() {
        if let path = Bundle.main.path(forResource: "Mastrerdata", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let masterData = try decoder.decode(MasterData.self, from: data)
                print("masterData:\(masterData)")

                let allAssets = masterData.data.attributes.cryptocoins
                assetsSubject.send(allAssets)
            } catch let error {
                print("parse error: \(error)")
            }
        } else {
            print("Invalid filename/path.")
        }

    }

}
