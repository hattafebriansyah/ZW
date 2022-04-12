//
//  EditPhonePresenterImpl.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation
import UIKit

class EditPhonePresenterImpl: EditPhonePresenter {
    var view: EditPhoneView
    var interactor: EditPhoneInteractor
    var route: EditPhoneRouter
    
    init(view: EditPhoneView, interactor: EditPhoneInteractor, route: EditPhoneRouter) {
        self.view = view
        self.interactor = interactor
        self.route = route
    }
    
    func showUserProfile() {
        self.interactor.getProfile()
    }
    
    func showbackToProfile(viewController: UIViewController) {
        self.route.navigateToProfile(viewController: viewController)
    }
    
}

extension EditPhonePresenterImpl: EditPhoneInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showProfile(profile: userProfile)
    }
}
