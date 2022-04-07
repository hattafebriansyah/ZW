//
//  InvoiceNetworkManager.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

public protocol InvoiceNetworkManager {
    func getThisWeekInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
    func getAllInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
}
