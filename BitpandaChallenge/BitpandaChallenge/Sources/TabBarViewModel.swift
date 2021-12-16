//
//  TabBarViewModel.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 15.12.21.
//

import Foundation

struct TabBarViewModel {


    init() {
    }

    func parseData() {
        if let path = Bundle.main.path(forResource: "Mastrerdata", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MasterData.self, from: data)
                print("jsonData:\(jsonData)")
            } catch let error {
                print(error)
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }

    }

}
