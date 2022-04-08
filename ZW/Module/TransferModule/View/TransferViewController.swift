//
//  TransferViewController.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import UIKit

class TransferViewController: UIViewController {
    //MARK: LABEL
    @IBOutlet weak var userPhoneNumber: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    //MARK: TEXTFIELD
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var notes: UITextField!
    
    //MARK: DECLARE
    var profile : UserProfileEntity?
    var presenter : TransferPresenterProtocol?
        //var popUpViewController : PopUpViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = "Aftabuddin Arsyad"
        userPhoneNumber.text = "+08123456789"
    }
    
    

    @IBAction func TransferAction(_ sender: Any) {
        let receiver = "1043"
        let amount = amount.text ?? ""
        let notes = notes.text ?? ""
        self.presenter?.transfer(receiver: receiver, amount: amount, notes: notes )
    }
}


extension TransferViewController : TransferView{
    func showAllert() {
        print("error")
    }
    
  
//    func showAllert(parentVC : UIViewController) {
//        self.popUpViewController =  PopUpViewController(nibName: "PopUpViewController", bundle: nil)
//        popUpViewController.modalPresentationStyle = .custom
//           popUpViewController.modalTransitionStyle = .crossDissolve
//           setting the delegate of the dialog box to the parent viewController
//           popUpViewController.delegate = parentVC as? PopUpDelegate
//           presenting the pop up viewController from the parent viewController
//           parentVC.present(popupViewController, animated: true)
//        print("Error")
//    }
    
    
    func getUser(userProfileEntity: UserProfileEntity) {
        userName.text = "Aftabuddin Arsyad"
    }
    
}
