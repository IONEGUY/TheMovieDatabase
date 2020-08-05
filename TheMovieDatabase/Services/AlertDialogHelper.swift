//
//  AlertDialogHelper.swift
//  TheMovieDatabase
//
//  Created by MacBook on 8/5/20.
//  Copyright © 2020 Ivan Zavadsky. All rights reserved.
//

import UIKit

class AlertDialogHelper {
    class func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        var rootViewController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        if let tabBarController = rootViewController as? UITabBarController {
            rootViewController = tabBarController.selectedViewController
        }

        rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
