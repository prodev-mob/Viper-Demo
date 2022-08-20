//
//  UserListContract.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewUserListProtocol {
    func showUserList(users: [User])
    func showAlert(message: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUserListProtocol {
    var view: PresenterToViewUserListProtocol? { get set }
    var interactor: PresenterToInteractorUserListProtocol? { get set }
    var router: PresenterToRouterUserListProtocol? { get set }
    
    func viewDidLoad()
    func getUserList()
    func navigation(vc: UserListVC, user: User)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUserListProtocol {
    var presenter: InteractorToPresenterUserListProtocol? { get set }
    func getUsersData()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUserListProtocol {
    func fetchUserData(users: [User])
    func showAlert(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUserListProtocol {
    static func createModule(viewController: UserListVC)
    func navigation(vc: UserListVC, user: User)
}
