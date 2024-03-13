//
//  NSLayoutConstraintRelation+.swift
//  SugarLayout
//
//  Created by Кирилл Романенко on 08.03.2024.
//

import UIKit

extension NSLayoutConstraint.Relation {
    var inverted: Self {
        switch self {
        case .lessThanOrEqual:
            return .greaterThanOrEqual
        case .equal:
            return .equal
        case .greaterThanOrEqual:
            return .lessThanOrEqual
        @unknown default:
            return .equal
        }
    }
}
