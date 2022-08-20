//
//  UserListVC.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import UIKit

class UserListVC: UIViewController, PresenterToViewUserListProtocol {
    
    // MARK: - IBOutlet
    @IBOutlet weak var userListTableView: UITableView!

    // MARK: - Variables
    var presenter: ViewToPresenterUserListProtocol?
    var arrUsers: [User] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        UserListRouter.createModule(viewController: self)
        presenter?.viewDidLoad()
        userListTableView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListTableViewCell")
    }
    
    // MARK: - Show User Data
    func showUserList(users: [User]) {
        arrUsers = users
        DispatchQueue.main.async {
            self.userListTableView.reloadData()
        }
    }
    
    // MARK: - show Alert
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error..!", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - UITableview Delegate & Datasource Methods
extension UserListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserListTableViewCell = userListTableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        cell.nameLabel.text = arrUsers[indexPath.row].name
        cell.userNameLabel.text = "@" + arrUsers[indexPath.row].username
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //navigation
        presenter?.navigation(vc: self, user: arrUsers[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
}
