//
//  View+.swift
//  SugarLayout
//
//  Created by Кирилл Романенко on 08.03.2024.
//

import UIKit

public extension UIView {
    @discardableResult
    func subviews(_ views: UIView...) -> UIView {
        for view in views {
            addSubview(view)
        }
        return self
    }
    
    func constraint(attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        func lookForConstraint(in view: UIView?) -> NSLayoutConstraint? {
            guard let constraints = view?.constraints else {
                return nil
            }
            
            for constraint in constraints {
                if self == constraint.firstItem as? NSObject && constraint.firstAttribute == attribute {
                    return constraint
                } else if self == constraint.secondItem as? NSObject && constraint.secondAttribute == attribute {
                    return constraint
                }
            }
            
            return nil
        }
        
        if attribute == .width || attribute == .height {
            return lookForConstraint(in: superview) ?? lookForConstraint(in: self)
        }

        return lookForConstraint(in: superview)
    }
    
    func removeConstraints() {
        let view = superview ?? self
        
        view.removeConstraints(
            view.constraints.filter {
                $0.firstItem === self
            }
        )
    }
}

extension UIView {
    func prepareForConstraintsIfNeeded() {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
