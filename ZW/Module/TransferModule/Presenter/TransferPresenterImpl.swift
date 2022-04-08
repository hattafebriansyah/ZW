//
//  TransferPresenterImpl.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import Foundation
import UIKit

class TransferPresenterImpl : TransferPresenterProtocol {
    func dismissPage(vc: UIViewController) {
        self.router.navigatetoHome()
    }
    
    
    let view: TransferView
    let interactor: TransferInteractorProtocol
    let router: TransferRouterProtocol

    init(view : TransferView, interactor : TransferInteractorProtocol, router : TransferRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getUser(userProfileEntity: UserProfileEntity) {
        self.view.getUser(userProfileEntity: userProfileEntity)
    }
    
    func transfer(receiver : String, amount: String, notes: String) {
        self.interactor.postTransferData(receiver: receiver, amount: amount, note: notes)
    }
    
    
}

extension TransferPresenterImpl : TransferInteractorOutputProtocol{
    func transactionSuccess(isSuccess: Bool) {
        if isSuccess {
            //self.view.showAllert()
            print("sukses")
        }else{
            print("gagal")
        }
    }
    
    func getUserProfile(userProfile: UserProfileEntity) {
        self.view.getUser(userProfileEntity: userProfile)
    }
    
    
}
