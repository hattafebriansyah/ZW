//
//  OTPViewController.swift
//  ZWallet
//
//  Created by user217064 on 4/6/22.
//

import UIKit

class OTPViewController: UIViewController {

    //textfield
    @IBOutlet weak var otp1: UITextField!
    @IBOutlet weak var otp2: UITextField!
    @IBOutlet weak var otp3: UITextField!
    @IBOutlet weak var otp4: UITextField!
    @IBOutlet weak var otp5: UITextField!
    @IBOutlet weak var otp6: UITextField!
    
    //button
    @IBOutlet weak var btnConfirmOTP: UIButton!
    
    //presenter
    var presenter: OTPPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.otp1.delegate = self
        self.otp2.delegate = self
        self.otp3.delegate = self
        self.otp4.delegate = self
        self.otp5.delegate = self
        self.otp6.delegate = self
        
        self.otp1.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp2.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp3.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp4.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp5.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.otp6.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        
    }
    
    @objc func changeCharacter(textField: UITextField){
        if textField.text?.utf8.count == 1 {
            switch textField {
            case otp1:
                otp2.becomeFirstResponder()
            case otp2:
                otp3.becomeFirstResponder()
            case otp3:
                otp4.becomeFirstResponder()
            case otp4:
                otp5.becomeFirstResponder()
            case otp5:
                otp6.becomeFirstResponder()
           //cek data sudah masuk atau tidak
            case otp6:
                print (
                    (otp1.text!),
                    (otp2.text!),
                    (otp3.text!),
                    (otp4.text!),
                    (otp5.text!),
                    (otp6.text!)
                )
            default:
                break
            }
        } else if textField.text!.isEmpty{
            switch textField {
            case otp6 :
                otp5.becomeFirstResponder()
            case otp5 :
                otp4.becomeFirstResponder()
            case otp4 :
                otp3.becomeFirstResponder()
            case otp3 :
                otp2.becomeFirstResponder()
            case otp2 :
                otp1.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    @IBAction func btnConfirmOTP(_ sender: Any) {
        let otpAll : String =   "\(otp1.text!)\(otp2.text!)\(otp3.text!)\(otp4.text!)\(otp5.text!)\(otp6.text!)"
//        print("Button Send OTP Triggered")
        let email = UserDefaultHelper.shared.get(key: .userEmail) ?? ""
        print(email)
        print(otpAll)
        self.presenter?.otpConfirm(email: email, otp: otpAll)
    }
    

}

extension OTPViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.utf16.count == 1 && !string.isEmpty {
            return false
        } else {
            return true
        }
    }
}
	
