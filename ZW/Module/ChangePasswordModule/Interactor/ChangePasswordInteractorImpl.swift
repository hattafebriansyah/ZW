//
//  ChangePasswordImpl.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation


class ChangePasswordInteractorImpl : ChangePasswordInteractorProtocol {
    
    
    var interactorOutput: ChangePasswordInteractorOutputProtocol?
    let changePasswordNetworkManager: ChangePasswordNetworkManager
    
    init(changePasswordNetworkManager : ChangePasswordNetworkManager){
        self.changePasswordNetworkManager = changePasswordNetworkManager
    }
    
    func postChangePasswordData(old_passsword: String, new_password: String) {
        self.changePasswordNetworkManager.changePassword(old_password: old_passsword, new_password: new_password) { data, error in
            print("\(data)")
            if data != nil{
                //trigger presenter jika proses berhasil
                self.interactorOutput?.transactionSuccess(isSuccess: true)
            }
            else {
                print("ini error\(String(describing: error))")
                //memberitahukan ke presenter jika proses gagal
                self.interactorOutput?.transactionSuccess(isSuccess: false)
            }
        }
    }

}
