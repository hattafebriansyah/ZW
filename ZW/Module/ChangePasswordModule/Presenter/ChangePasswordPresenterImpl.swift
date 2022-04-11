//
//  ChangePasswordPresenterImpl.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation
import UIKit

class ChangePasswordPresenterImpl : ChangePasswordPresenterProtocol {
    
    
    
    
    let view: ChangePasswordViewController
    let interactor: ChangePasswordInteractorProtocol
    let router: ChangePasswordRouterProtocol


    init(view : ChangePasswordViewController, interactor : ChangePasswordInteractorProtocol, router : ChangePasswordRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func navigatetoHome() {
        self.router.navigatetoHome()
    }
    
}

extension ChangePasswordPresenterImpl : ChangePasswordInteractorOutputProtocol{
    
}


