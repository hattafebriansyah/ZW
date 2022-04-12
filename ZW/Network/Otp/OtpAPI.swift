//
//  OtpAPI.swift
//  ZWallet
//
//  Created by user217064 on 4/6/22.
//

import Foundation
import Moya

public enum OtpAPI {
    case OTP(email : String , otp :String)
}

extension OtpAPI: TargetType {
    public var path: String {
        switch self {
       
            
        case .OTP(let email,let otp) :
            return "auth/activate/\(email)/\(otp)"

        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
       
            
        case .OTP(let email, let otp):
            return .requestParameters(
                parameters: ["email": email, "otp": otp],
                encoding: JSONEncoding.default
            )
        }
    }

    public var baseURL: URL {
        return URL(string: String(describing: "http://3.89.145.177:8000"))!
    }

    public var method: Moya.Method {
        return .get
    }

    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
}
