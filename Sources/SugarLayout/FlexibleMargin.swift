//
//  FlexibleMargin.swift
//  SugarLayout
//
//  Created by Кирилл Романенко on 08.03.2024.
//

import UIKit

public struct FlexibleMargin {
    let value: CGFloat
    let relation: NSLayoutConstraint.Relation
}

prefix operator >=

@discardableResult
public prefix func >= (p: CGFloat) -> FlexibleMargin {
    FlexibleMargin(value: p, relation: .greaterThanOrEqual)
}

prefix operator <=

@discardableResult
public prefix func <= (p: CGFloat) -> FlexibleMargin {
    FlexibleMargin(value: p, relation: .lessThanOrEqual)
}
