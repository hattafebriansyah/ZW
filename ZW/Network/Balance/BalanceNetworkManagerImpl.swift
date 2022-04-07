//
//  BalanceNetworkManagerImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import Moya

public class BalanceNetworkManagerImpl: BalanceNetworkManager {
    public init() {
        
    }
    
    public func getBalance(completion: @escaping (GetBalanceDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<BalanceApi>()
        provider.request(.getBalance) { result in
            switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let getBalanceResponse = try decoder.decode(GetBalanceResponse.self, from: res.data)
                    completion(getBalanceResponse.data[0], nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
