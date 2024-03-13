//
//  View+Size.swift
//  SugarLayout
//
//  Created by Кирилл Романенко on 08.03.2024.
//

import UIKit

public extension UIView {
    @discardableResult
    func size(_ value: CGFloat = 0,
              to view: AnyObject? = nil) -> UIView {
        return width(value, to: view)
            .height(value, to: view)
    }
    
    @discardableResult
    func height(_ value: CGFloat = 0,
                to view: AnyObject? = nil,
                edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.height,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: value)
    }
    
    @discardableResult
    func width(_ value: CGFloat = 0,
               to view: AnyObject? = nil,
               edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.width,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: value)
    }
    
    @discardableResult
    func size(_ fm: FlexibleMargin,
              to view: AnyObject? = nil) -> UIView {
        return width(fm, to: view)
            .height(fm, to: view)
    }
    
    @discardableResult
    func height(_ fm: FlexibleMargin,
                to view: AnyObject? = nil,
                edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.height,
                          relatedBy: fm.relation,
                          to: view,
                          withAttribute: attribute,
                          points: fm.value)
    }
    
    @discardableResult
    func width(_ fm: FlexibleMargin,
               to view: AnyObject? = nil,
               edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.width,
                          relatedBy: fm.relation,
                          to: view,
                          withAttribute: attribute,
                          points: fm.value)
    }
}

fileprivate extension UIView {
    func constraint(_ attribute: NSLayoutConstraint.Attribute,
                    relatedBy: NSLayoutConstraint.Relation,
                    to view: AnyObject?,
                    withAttribute: NSLayoutConstraint.Attribute?,
                    points: Double) -> Self {
        prepareForConstraintsIfNeeded()
        let constraint = NSLayoutConstraint.create(item: self,
                                                   attribute: attribute,
                                                   relatedBy: relatedBy,
                                                   toItem: view,
                                                   withAttribute: withAttribute,
                                                   constant: points)
        (superview ?? self).addConstraint(constraint)
        return self
    }
}
