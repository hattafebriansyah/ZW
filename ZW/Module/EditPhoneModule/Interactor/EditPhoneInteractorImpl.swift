//
//  EditPhoneInteractorImpl.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation

class EditPhoneInteractorImpl: EditPhoneInteractor {
    
    var user: UserProfileEntity
    var interactorOutput: EditPhoneInteractorOutput?
    
    var networkManager: BalanceNetworkManager
    
    init(user: UserProfileEntity, networkManager: BalanceNetworkManager) {
        self.user = user
        self.networkManager = networkManager
    }
    
    func getProfile() {
        self.interactorOutput?.loadedUserProfileData(userProfile: user)
    }
    
    func updateProfilePhone(profile: UserProfileEntity) {
        
    }
}
