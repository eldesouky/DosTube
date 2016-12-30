//
//  Extenstions.swift
//  DosTube
//
//  Created by Mahmoud Eldesouky on 7/4/16.
//  Copyright © 2016 Mahmoud Eldesouky. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

// MARK - Constraints
extension UIView {
    
    // takes the constraint string and a dictionary of views to apply on
    func addConstraintsWithFormat(format: String, views:UIView...){
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false // to allow applying constrains in setupViews()
            
        }
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}