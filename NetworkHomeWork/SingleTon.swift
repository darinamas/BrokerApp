//
//  SingleTon.swift
//  NetworkHomeWork
//
//  Created by Daryna Polevyk on 17.06.2021.
//

import Foundation

class SingleTon {
    static var shared = SingleTon()
    
    var json: [ModelTypeForDecode]?

    var validCredentials = [(username: "111", password: "111"), (username: "aaa", password: "aaa"), (username: "123", password: "123")]

    var arrayWithDetails: [DetailsData] = []
    
    private init() {
    }
}


struct ModelTypeForDecode: Decodable {
    let digits: Int
    let ask: Double
    let bid: Double
    let change: Double
    let symbol: String
    let lasttime: Int
    let change24h: Double
}

struct DetailsData {
    let title: String
    let value: String
}
