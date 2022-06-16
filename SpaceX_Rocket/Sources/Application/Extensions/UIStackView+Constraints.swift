//
//  UIStackView Constraints.swift
//  SpaceX_Rocket
//
//  Created by mac on 15.06.22.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
