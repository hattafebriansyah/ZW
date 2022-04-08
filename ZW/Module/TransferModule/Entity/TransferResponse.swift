//
//  TransferResponse.swift
//  ZW
//
//  Created by user217064 on 4/8/22.
//

import Foundation

public struct TransferResponse: Codable {
    public var status: Int
    public var message: String
    public var data: TransferDataResponse
}

public struct TransferDataResponse: Codable {
    let sender, receiver, amount: Int
    let notes: String
    let type: Int
    let createdAt: String
}


