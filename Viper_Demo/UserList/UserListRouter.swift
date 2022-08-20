//
//  UserListRouter.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import Foundation
import UIKit

class UserListRouter: PresenterToRouterUserListProtocol {
    
    // MARK: Static methods
    static func createModule(viewController: UserListVC) {
        let presenter: ViewToPresenterUserListProtocol & InteractorToPresenterUserListProtocol = UserListPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = UserListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UserListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
    }
    
    // MARK: - Navigation
    func navigation(vc: UserListVC, user: User) {
        let userDetailsVC: UserDetailsVC = vc.storyboard?.instantiateViewController(withIdentifier: "UserDetailsVC") as! UserDetailsVC
        UserDetailsRouter.createModule(viewController: userDetailsVC, user: user)
        vc.navigationController?.pushViewController(userDetailsVC, animated: true)
    }
}
