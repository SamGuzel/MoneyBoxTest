//
//  AppDelegate.swift
//  MoneyBox
//
//  Created by Zeynep Kara on 15.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = LoginViewController()
		window.makeKeyAndVisible()
		self.window = window
		
        return true
    }
}

/// we want that nice MoneyBox Background :)
extension UIColor {
	class var GreyColor: UIColor {
		if let color = UIColor(named: "GreyColor") {
			return color
		}
		fatalError("Could not find GreyColor")
	}
	
	class var AccentColor: UIColor {
		if let color = UIColor(named: "AccentColor") {
			return color
		}
		fatalError("Could not find AccentColor")
	}
	
	class var GreenGreyColor: UIColor {
		if let color = UIColor(named: "GreenGreyColor") {
			return color
		}
		fatalError("Could not find GreenGreyColor")
	}
}
