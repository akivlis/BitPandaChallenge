//
//  Attributes.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 15.12.21.
//

import Foundation

struct Attributes: Decodable {

    let cryptocoins: [Cryptocoin]
    let commodities: [Commodity]
    let fiats: [Fiat]
}

struct AttributesData: Decodable {
    let type: String
    let attributes: Attributes
}

struct MasterData: Decodable {
    let data: AttributesData
}


