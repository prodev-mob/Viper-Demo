//
//  UserListInteractor.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import Foundation

class UserListInteractor: PresenterToInteractorUserListProtocol {

    // MARK: Variables
    var presenter: InteractorToPresenterUserListProtocol?
    
    // MARK: - Get UsersData
    func getUsersData() {
        var urlRequest = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode([User].self, from: data ?? Data())
                self.presenter?.fetchUserData(users: responseObject)
            } catch {
                DispatchQueue.main.async {
                    self.presenter?.showAlert(message: error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
