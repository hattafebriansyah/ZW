//
//  HomePresenter.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import UIKit

protocol HomePresenter {
    func loadProfile()
    func loadTransaction()
    func showHistory(viewController: UIViewController)
    func logout()
}
