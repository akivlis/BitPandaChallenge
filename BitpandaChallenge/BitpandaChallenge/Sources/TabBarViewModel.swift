//
//  TabBarViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 15.12.21.
//

import Foundation
import Combine

struct TabBarViewModel {

    private(set) lazy var assetsPublisher = attributesSubject
        .map { $0.assets }
        .eraseToAnyPublisher()

    private let attributesSubject = PassthroughSubject<Attributes, Never>()
    private(set) lazy var attributesPublisher = attributesSubject
        .eraseToAnyPublisher()

    // MARK: - Public

    func parseData() {
        if let path = Bundle.main.path(forResource: "Mastrerdata", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let masterData = try decoder.decode(MasterData.self, from: data)
                print("masterData:\(masterData)")

                attributesSubject.send(masterData.data.attributes)
            } catch let error {
                print("parse error: \(error)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
}
