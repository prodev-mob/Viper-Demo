//
//  UserDetailsVC.swift
//  Viper_Demo
//
//  Created by macOS on 16/07/22.
//  
//

import UIKit

class UserDetailsVC: UIViewController, PresenterToViewUserDetailsProtocol {
      
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    // MARK: - Variables
    var presenter: ViewToPresenterUserDetailsProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Show Alert Button Click
    @IBAction func showAlertButtonClick(_ sender: UIButton) {
        presenter?.showAlert()
    }
    
    // MARK: - Show UserDetails
    func showUserDetails(user: User) {
        nameLabel.text = "User: @\(user.username)"
        userNameLabel.text = "Name: \(user.name)"
        emailLabel.text = "Email: \(user.email)"
        streetLabel.text = "Street: \(user.address.suite)"
        cityLabel.text = "City: \(user.address.city)"
        zipCodeLabel.text = "Zip Code: \(user.address.zipcode)"
    }
    
    // MARK: - Show Alert
    func showAlert(user: User) {
        let alert = UIAlertController(title: "User Details", message: "Name: \(user.name)\n" + "User: \(user.username)\n" + "Email: \(user.email)\n" + "City: \(user.address.city)", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
