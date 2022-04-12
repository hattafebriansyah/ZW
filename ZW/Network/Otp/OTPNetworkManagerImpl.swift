//
//  OTPNetworkManagerImpl.swift
//  ZWallet
//
//  Created by user217064 on 4/6/22.
//

import Foundation
import Moya

public class OTPNetworkManagerImpl: OTPNetworkManager {
    
    public init() {
        
    }

    public func otpConfirm(email: String, otp: String, completion: @escaping (OTPDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<OtpAPI>()
    
        provider.request(.OTP(email: email, otp: otp)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let otpResponse = try decoder.decode(OTPDataResponse.self, from: result.data)
                    completion(otpResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
