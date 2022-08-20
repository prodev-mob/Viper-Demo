//
//  UserDetailsPresenter.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import Foundation

class UserDetailsPresenter: ViewToPresenterUserDetailsProtocol, InteractorToPresenterUserDetailsProtocol {

    // MARK: Variables
    var view: PresenterToViewUserDetailsProtocol?
    var interactor: PresenterToInteractorUserDetailsProtocol?
    var router: PresenterToRouterUserDetailsProtocol?
    var user: User?
    
    //MARK: - ViewDidLoad
    func viewDidLoad() {
        showUserDetails(user: user!)
    }
    //MARK: - Show User Details
    func showUserDetails(user: User) {
        view?.showUserDetails(user: user)
    }
    
    //MARK: - Show Alert
    func showAlert() {
        view?.showAlert(user: user!)
    }
}
