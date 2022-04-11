//
//  TopUpRouterImpl.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation
import UIKit


import UIKit


public class TopUpRouterImpl{
   
    
    public static func navigateToModule(viewController : UIViewController) {
        let vc = TopUpViewController(nibName: "TopUpViewController", bundle: nil)

        let router = TopUpRouterImpl()
        let interactor = TopUpInteractorImpl()
        let presenter = TopUpPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        

        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
        
    }



extension TopUpRouterImpl : TopUpRouterProtocol{
    //
    
}



    
    

   
    
    

