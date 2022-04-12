//
//  OTPInteractorImpl.swift
//  ZW
//
//  Created by user217064 on 4/12/22.
//

import Foundation

class OTPInteractorImpl : OTPInteractorProtocol {
    
    
    var interactorOutput: OTPInteractorOutputProtocol?
    let otpNetworkManager: OTPNetworkManager
    
    init(networkManager: OTPNetworkManager) {
        self.otpNetworkManager = networkManager
    }
    
    func postOtpData(email: String, otp: String) {
        //mengirimkan data email dan password ke API
        self.otpNetworkManager.otpConfirm(email: email, otp: otp) { data, error in
            print(data)
            if data != nil {
                self.interactorOutput?.authenticationResult(isSuccess: true)
            }
            else {
                print("ini error\(String(describing: error))")
                //memberitahukan ke presenter jika proses gagal
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
        }
    }
}
