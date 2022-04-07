//
//  BalanceAPI.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import Moya

public enum BalanceApi {
    case getBalance
}

extension BalanceApi: TargetType {
    public var baseURL: URL {
        return URL(string: String(describing: "http://3.89.145.177:8000"))!
    }
    
    public var path: String {
        switch self {
        case .getBalance:
            return "/home/getBalance"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .getBalance:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
}
