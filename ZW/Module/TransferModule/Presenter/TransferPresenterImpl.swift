//
//  TransferPresenterImpl.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import Foundation
import UIKit

class TransferPresenterImpl : TransferPresenterProtocol {
    func navigatetoHome() {
        self.router.navigatetoHome()
    }
    
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
    
    func showPopUp() {
        let alertController = UIAlertController(title: "Add new tag", message: nil, preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
                    if let txtField = alertController.textFields?.first, let text = txtField.text {
                        // operations
                        print("Text==>" + text)
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
                alertController.addTextField { (textField) in
                    textField.placeholder = "Tag"
                }
                alertController.addAction(confirmAction)
                alertController.addAction(cancelAction)
        alertController.present(alertController, animated: true, completion: nil)
    }
    
    
    }

extension TransferPresenterImpl : TransferInteractorOutputProtocol{
    func transactionSuccess(isSuccess: Bool) {
        if isSuccess {
            showPopUp()
            print("sukses")
        }else{
            self.view.showAllertFailed()
            print("gagal")
        }
    }
    
    func getUserProfile(userProfile: UserProfileEntity) {
        self.view.getUser(userProfileEntity: userProfile)
    }
    
   
    
}


