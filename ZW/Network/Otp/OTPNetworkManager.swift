//
//  OTPNetworkManager.swift
//  ZWallet
//
//  Created by user217064 on 4/6/22.
//

import Foundation

public protocol OTPNetworkManager{
    func otpConfirm(
        email: String,
        otp: String,
        completion: @escaping (OTPDataResponse?, Error?) -> ())
}
