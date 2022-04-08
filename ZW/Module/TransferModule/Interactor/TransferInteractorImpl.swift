//
//  TransferInteractorImpl.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import Foundation

class TransferInteractorImpl : TransferInteractorProtocol {
    
    
    var interactorOutput: TransferInteractorOutputProtocol?
    let transferNetworkManager: TransferNetworkManager
    
    init(transferNetworkManager : TransferNetworkManager){
        self.transferNetworkManager = transferNetworkManager
        
    }
    
    func postTransferData(receiver : String, amount: String, note: String) {
        self.transferNetworkManager.transfer(receiver: receiver, amount: amount, notes: note) { data, error in
            if data != nil{
                //menyimpan token
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
    
//    func postTransferData(balance: String, note: String) {
//        UserDefaultHelper.shared.set(key: .balance, value: balance)
//        UserDefaultHelper.shared.set(key: .notes, value: note)
//
//
//    }
    
    
    
    func getUserProfile(){
    let name: String = UserDefaultHelper.shared.get(key: .userName) ?? ""
    let phone : String = UserDefaultHelper.shared.get(key: .userPhone) ?? ""
    var user = UserProfileEntity(name: name, balance: 0, phoneNumber: phone, imageUrl: "")
    self.interactorOutput?.getUserProfile(userProfile: user)
    }
    
   
    
}
