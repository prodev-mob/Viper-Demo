//
//  UserListPresenter.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import Foundation
import UIKit

class UserListPresenter: ViewToPresenterUserListProtocol, InteractorToPresenterUserListProtocol {
      
    // MARK: Variables
    var view: PresenterToViewUserListProtocol?
    var interactor: PresenterToInteractorUserListProtocol?
    var router: PresenterToRouterUserListProtocol?
    
    // MARK: - ViewDidLoad
    func viewDidLoad() {
        getUserList()
    }
    
    // MARK: - Get UserList
    func getUserList() {
        interactor?.getUsersData()
    }
    
    // MARK: - Navigation
    func navigation(vc: UserListVC, user: User) {
        router?.navigation(vc: vc, user: user)
    }
    
    // MARK: - Fetching data
    func fetchUserData(users: [User]) {
        view?.showUserList(users: users)
    }
    
    // MARK: - Show Alert
    func showAlert(message: String) {
        view?.showAlert(message: message)
    }
}
