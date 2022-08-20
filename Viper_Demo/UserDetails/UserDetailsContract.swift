//
//  UserDetailsContract.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewUserDetailsProtocol {
    func showUserDetails(user: User)
    func showAlert(user: User)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUserDetailsProtocol {    
    var view: PresenterToViewUserDetailsProtocol? { get set }
    var interactor: PresenterToInteractorUserDetailsProtocol? { get set }
    var router: PresenterToRouterUserDetailsProtocol? { get set }
    var user: User? { get set }
    func viewDidLoad()
    func showUserDetails(user: User)
    func showAlert()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUserDetailsProtocol {
    
    var presenter: InteractorToPresenterUserDetailsProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUserDetailsProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUserDetailsProtocol {
    static func createModule(viewController: UserDetailsVC, user: User)
}
