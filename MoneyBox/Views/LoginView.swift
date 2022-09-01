//
//  LoginView.swift
//  MoneyBox
//
//  Created by Sam Guzel on 01/09/2022.
//

import Foundation
import UIKit

class LoginView: UIView {
	
	let stackView = UIStackView()
	let emailTextField = UITextField()
	let passwordTextField = UITextField()
	let textDividerView = UIView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		style()
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("Init(coder:) has not be implemented")
	}
}

/// breakout the chunks we want to not keep the above too busy
extension LoginView {
	
	func style() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .systemBackground
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 8
		
		/// set up our input boxes
		emailTextField.translatesAutoresizingMaskIntoConstraints = false
		emailTextField.placeholder = "Email"
		emailTextField.delegate = self
		
		/// divider between to split it up a bit
		textDividerView.translatesAutoresizingMaskIntoConstraints = false
		textDividerView.backgroundColor = .secondarySystemFill
		
		/// set up our input for password
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordTextField.placeholder = "Password"
		passwordTextField.isSecureTextEntry = true
		passwordTextField.delegate = self
		
		/// rounded corners
		layer.cornerRadius = 5
		clipsToBounds = true
	}
	
	func layout() {
		
		stackView.addArrangedSubview(emailTextField)
		stackView.addArrangedSubview(textDividerView)
		stackView.addArrangedSubview(passwordTextField)
		addSubview(stackView)
		
		/// doing it here for direct access rather than needing view. in the controller
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: topAnchor, multiplier: 1),
			stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
			trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
			bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
		])
		
		textDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
	}
}

/// allow regestration of the textfield delegates
extension LoginView: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		emailTextField.endEditing(true)
		passwordTextField.endEditing(true)
		return true
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) { }
}
