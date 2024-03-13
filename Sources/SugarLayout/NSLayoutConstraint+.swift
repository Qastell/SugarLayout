//
//  NSLayoutConstraint+.swift
//  SugarLayout
//
//  Created by Кирилл Романенко on 08.03.2024.
//

import UIKit

extension NSLayoutConstraint {
    static func create(item view1: AnyObject,
                       attribute attr1: NSLayoutConstraint.Attribute,
                       relatedBy: NSLayoutConstraint.Relation = .equal,
                       toItem view2: AnyObject? = nil,
                       withAttribute attr2: NSLayoutConstraint.Attribute? = nil,
                       multiplier: CGFloat = 1,
                       constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view1,
                                  attribute: attr1,
                                  relatedBy: relatedBy,
                                  toItem: view2,
                                  attribute: attr2 ?? attr1,
                                  multiplier: multiplier,
                                  constant: constant)
    }
}
