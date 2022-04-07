//
//  AuthApi.swift
//  ZWallet
//
//  Created by user217917 on 3/31/22.
//

import Foundation
import Moya


public enum AuthApi {
    case login(email: String, password: String)
    case register(username: String, email: String, password: String)
}

extension AuthApi: TargetType {
    public var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .register:
            return "/auth/signup"
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(
                parameters: ["email": email, "password": password],
                encoding: JSONEncoding.default
            )
        case .register(let username, let email, let password):
            return .requestParameters(
                parameters: ["username": username, "email": email, "password": password],
                encoding: JSONEncoding.default
        )
        }
    }
        

    public var baseURL: URL {
        return URL(string: String(describing: "http://3.89.145.177:8000"))!
    }

    public var method: Moya.Method {
        return .post
    }

    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
}
