//
//  EditPhoneViewController.swift
//  ZW
//
//  Created by user215381 on 4/10/22.
//

import UIKit

class EditPhoneViewController: UIViewController {

    @IBOutlet weak var phoneNoTF: UITextField!
    
    var presenter: EditPhonePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.showUserProfile()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBack(_ sender: Any) {
        self.presenter?.showbackToProfile(viewController: self)
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
    }
}

extension EditPhoneViewController: EditPhoneView {
    func showProfile(profile: UserProfileEntity) {
        
    }
}
