//
//  UserDetailsRouter.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import Foundation
import UIKit

class UserDetailsRouter: PresenterToRouterUserDetailsProtocol {
    
    // MARK: Static methods
    static func createModule(viewController: UserDetailsVC, user: User) {
        var presenter: ViewToPresenterUserDetailsProtocol & InteractorToPresenterUserDetailsProtocol = UserDetailsPresenter()
        presenter.user = user
        viewController.presenter = presenter
        viewController.presenter?.router = UserDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UserDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
    }
}
