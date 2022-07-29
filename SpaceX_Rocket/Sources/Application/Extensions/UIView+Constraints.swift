//
//  UIView Constraints.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 15.06.22.
//

import UIKit


extension UIView {
    
    func addSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}


