//
//  View+Position.swift
//  SugarLayout
//
//  Created by Кирилл Романенко on 08.03.2024.
//

import UIKit

// MARK: - Container

public extension UIView {
    @discardableResult
    func edges(_ value: CGFloat = 0,
               to view: AnyObject? = nil) -> UIView {
        return verticalEdges(value, to: view)
            .horizontalEdges(value, to: view)
    }
    
    @discardableResult
    func edges(_ fm: FlexibleMargin,
               to view: AnyObject? = nil,
               edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return verticalEdges(fm, to: view)
            .horizontalEdges(fm, to: view)
    }
    
    @discardableResult
    func directionalEdges(_ value: CGFloat = 0,
                          to view: AnyObject? = nil) -> UIView {
        return verticalEdges(value, to: view)
            .directionalHorizontalEdges(value, to: view)
    }
    
    @discardableResult
    func directionalEdges(_ fm: FlexibleMargin,
                          to view: AnyObject? = nil,
                          edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return verticalEdges(fm, to: view)
            .directionalHorizontalEdges(fm, to: view)
    }
}

public extension UIView {
    @discardableResult
    func center(_ value: CGFloat = 0,
                to view: AnyObject? = nil) -> UIView {
        return centerY(value, to: view)
            .centerX(value, to: view)
    }
    
    @discardableResult
    func center(_ fm: FlexibleMargin,
                to view: AnyObject? = nil,
                edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return centerY(fm, to: view)
            .centerX(fm, to: view)
    }
}

// MARK: - Y axis

public extension UIView {
    @discardableResult
    func centerY(_ value: CGFloat = 0,
                 to view: AnyObject? = nil,
                 edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.centerY,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: value)
    }
    
    @discardableResult
    func centerY(_ fm: FlexibleMargin,
                 to view: AnyObject? = nil,
                 edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.centerY,
                          relatedBy: fm.relation,
                          to: view,
                          withAttribute: attribute,
                          points: fm.value)
    }
}

// MARK: - Top/Bottom

public extension UIView {
    @discardableResult
    func verticalEdges(_ value: CGFloat = 0,
                       to view: AnyObject? = nil) -> UIView {
        return top(value, to: view)
            .bottom(value, to: view)
    }
    
    @discardableResult
    func verticalEdges(_ fm: FlexibleMargin,
                       to view: AnyObject? = nil) -> UIView {
        return top(fm, to: view)
            .bottom(fm, to: view)
    }
}

public extension UIView {
    @discardableResult
    func top(_ value: CGFloat = 0,
             to view: AnyObject? = nil,
             edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.top,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: value)
    }
    
    @discardableResult
    func bottom(_ value: CGFloat = 0,
                to view: AnyObject? = nil,
                edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.bottom,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: -value)
    }
    
    @discardableResult
    func top(_ fm: FlexibleMargin,
             to view: AnyObject? = nil,
             edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.top,
                          relatedBy: fm.relation,
                          to: view,
                          withAttribute: attribute,
                          points: fm.value)
    }
    
    @discardableResult
    func bottom(_ fm: FlexibleMargin,
                to view: AnyObject? = nil,
                edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.bottom,
                          relatedBy: fm.relation.inverted,
                          to: view,
                          withAttribute: attribute,
                          points: -fm.value)
    }
}

// MARK: - X axis

public extension UIView {
    @discardableResult
    func centerX(_ value: CGFloat = 0,
                 to view: AnyObject? = nil,
                 edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.centerX,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: value)
    }
    
    @discardableResult
    func centerX(_ fm: FlexibleMargin,
                 to view: AnyObject? = nil,
                 edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.centerX,
                          relatedBy: fm.relation,
                          to: view,
                          withAttribute: attribute,
                          points: fm.value)
    }
}

// MARK: - Left/Right

public extension UIView {
    @discardableResult
    func horizontalEdges(_ value: CGFloat = 0,
                         to view: AnyObject? = nil) -> UIView {
        return right(value, to: view)
            .left(value, to: view)
    }
    
    @discardableResult
    func horizontalEdges(_ fm: FlexibleMargin,
                         to view: AnyObject? = nil) -> UIView {
        return right(fm, to: view)
            .left(fm, to: view)
    }
}

public extension UIView {
    @discardableResult
    func right(_ value: CGFloat = 0,
               to view: AnyObject? = nil,
               edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.right,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: -value)
    }
    
    @discardableResult
    func left(_ value: CGFloat = 0,
              to view: AnyObject? = nil,
              edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.left,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: value)
    }
    
    @discardableResult
    func right(_ fm: FlexibleMargin,
               to view: AnyObject? = nil,
               edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.right,
                          relatedBy: fm.relation.inverted,
                          to: view,
                          withAttribute: attribute,
                          points: -fm.value)
    }
    
    @discardableResult
    func left(_ fm: FlexibleMargin,
              to view: AnyObject? = nil,
              edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.left,
                          relatedBy: fm.relation,
                          to: view,
                          withAttribute: attribute,
                          points: fm.value)
    }
}

// MARK: - Leading/Trailing

public extension UIView {
    @discardableResult
    func directionalHorizontalEdges(_ value: CGFloat = 0,
                                    to view: AnyObject? = nil) -> UIView {
        return trailing(value, to: view)
            .leading(value, to: view)
    }
    
    @discardableResult
    func directionalHorizontalEdges(_ fm: FlexibleMargin,
                                    to view: AnyObject? = nil) -> UIView {
        return trailing(fm, to: view)
            .leading(fm, to: view)
    }
}

public extension UIView {
    @discardableResult
    func trailing(_ value: CGFloat = 0,
                  to view: AnyObject? = nil,
                  edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.trailing,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: -value)
    }
    
    @discardableResult
    func leading(_ value: CGFloat = 0,
                 to view: AnyObject? = nil,
                 edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.leading,
                          relatedBy: .equal,
                          to: view,
                          withAttribute: attribute,
                          points: value)
    }
    
    @discardableResult
    func trailing(_ fm: FlexibleMargin,
                  to view: AnyObject? = nil,
                  edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.trailing,
                          relatedBy: fm.relation.inverted,
                          to: view,
                          withAttribute: attribute,
                          points: -fm.value)
    }
    
    @discardableResult
    func leading(_ fm: FlexibleMargin,
                 to view: AnyObject? = nil,
                 edge attribute: NSLayoutConstraint.Attribute? = nil) -> UIView {
        return constraint(.leading,
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
        let view = view ?? superview
        let constraint = NSLayoutConstraint.create(item: self,
                                                   attribute: attribute,
                                                   relatedBy: relatedBy,
                                                   toItem: view,
                                                   withAttribute: withAttribute,
                                                   constant: points)
        superview?.addConstraint(constraint)
        return self
    }
}

