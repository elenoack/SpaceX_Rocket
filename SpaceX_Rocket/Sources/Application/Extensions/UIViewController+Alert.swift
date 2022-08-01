//
//  UIViewController+Alert.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 30.07.22.
//

import UIKit


extension UIViewController {
    
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   actions: [UIAlertAction] = []) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        if actions.isEmpty {
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func showImageAlert(title: String? = nil,
                        message: String? = nil,
                        actions: [UIAlertAction] = []) {
             let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let image = UIImageView(image: UIImage(named: "notInfo"))
        alert.view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: .zero))
        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: alert.view, attribute: .centerY, multiplier: 1, constant: .zero))
        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44))
        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44))
             for action in actions {
                 alert.addAction(action)
             }
             if actions.isEmpty {
                 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
             }
             
             present(alert, animated: true, completion: nil)
         }
}
