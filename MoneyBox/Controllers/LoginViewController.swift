//
//  LoginViewController.swift
//  MoneyBox
//
//  Created by Zeynep Kara on 16.01.2022.
//

import UIKit
import Networking


//A login screen to allow existing users to sign in
//A screen to show the accounts the user holds, e.g. ISA, GIA
//A screen to show some details of the account, including a simple button to add money to its moneybox.
//The button will add a fixed amount of £10. It should use the POST /oneoffpayments endpoint provided, and the account's Moneybox amount would be updated.
class LoginViewController: UIViewController {
	
	let dataProvider = DataProvider()
	
	struct userData: Codable {
		let email: String
		let password: String
	}
	
	let logo = UIImageView(image: UIImage(named: "moneybox"))
	let loginView = LoginView()
	let loginButton = UIButton(type: .system)
	let errorMessageLabel = UILabel()
	
	var email: String? {
		return loginView.emailTextField.text
	}
	
	var password: String? {
		return loginView.passwordTextField.text
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		layout()
	}
}

extension LoginViewController {
	private func setupUI() {
		loginView.translatesAutoresizingMaskIntoConstraints = false
		logo.translatesAutoresizingMaskIntoConstraints = false
		
		/// handle the login button
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		loginButton.setTitleColor(.black, for: .normal)
		loginButton.backgroundColor = .AccentColor
		loginButton.setTitle("Login", for: [])
		loginButton.addTarget(self, action: #selector(loginTapped), for: .primaryActionTriggered)
		
		/// rounded corners
		loginButton.layer.cornerRadius = 5
		loginButton.clipsToBounds = true
		view.backgroundColor = .GreenGreyColor
		
		errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
		errorMessageLabel.textAlignment = .center
		errorMessageLabel.textColor = .systemRed
		errorMessageLabel.numberOfLines = 0
		errorMessageLabel.text = "Unexpected Error Occured please contact Customer Service on 12345"
		errorMessageLabel.isHidden = true
	}
	
	private func layout() {
		view.addSubview(logo)
		view.addSubview(loginView)
		view.addSubview(loginButton)
		view.addSubview(errorMessageLabel)
		
		/// logo
		NSLayoutConstraint.activate([
			loginView.topAnchor.constraint(equalToSystemSpacingBelow: logo.bottomAnchor, multiplier: 3),
			logo.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
			logo.trailingAnchor.constraint(equalTo: logo.trailingAnchor)

		])
		
		/// login view
		NSLayoutConstraint.activate([
			loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
			view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
		])
		
		/// button view
		NSLayoutConstraint.activate([
			loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
			loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
			loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
		])
		
		/// error view
		NSLayoutConstraint.activate([
			errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2),
			errorMessageLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
			errorMessageLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor)
		])
		
		
	}
}

extension LoginViewController {
	@objc func loginTapped(sender: UIButton) {
		errorMessageLabel.isHidden = true
		login()
	}
	
	private func login() {
		guard let email = email, let password = password else {
			assertionFailure("Username / password should never be nil")
			return
		}
		
		if email.isEmpty || password.isEmpty {
			configureView(withMessage: "Username / Password cannot be blank")
		}
		let request = LoginRequest(email: email, password: password)
		
		dataProvider.login(request: request , completion: { result in
			switch result {
			case .failure(let error):
				self.errorMessageLabel.text = error.localizedDescription
				
			case .success:
				self.loginButton.backgroundColor = .orange
			}
			
		})
		/// temp
		if  email == "Sam" && password == "sam" {
			loginButton.backgroundColor = .green
		} else {
			configureView(withMessage: "Incorrect Login Details")
		}
		
	}
	private func configureView(withMessage message: String) {
		errorMessageLabel.text = message
		errorMessageLabel.isHidden = false
	}
}
