import XCTest
@testable import SugarLayout

fileprivate extension UIView {
    var activeConstraints: [NSLayoutConstraint] {
        return constraints.filter { $0.isActive }
    }
}

final class SugarLayoutTests: XCTestCase {
    
    let view = UIView()
    
    func testSubviews() {
        view.subviews(
            UIView(),
            UIView()
        )
        
        XCTAssertEqual(
            view.subviews.count,
            2,
            "Should have 2 subviews"
        )
    }
    
    func testConstraints() {
        let barView = UIView()
        let fooView = UIView()
        
        view.subviews(
            barView,
            fooView
        )
        
        barView.edges(10)
        
        XCTAssertEqual(
            view.activeConstraints.count,
            4,
            "Should have 4 active constraints"
        )
        
        fooView
            .top(to: barView, edge: .bottom)
            .leading(50, edge: .trailing)
        
        XCTAssertEqual(
            view.activeConstraints.count,
            6,
            "Should have 6 active constraints"
        )
    }
    
    func testEdges() {
        let barView = UIView()
        view.subviews(barView)
        
        barView.edges(20)
        
        XCTAssertEqual(
            view.activeConstraints.count,
            4,
            "Should have 4 active constraints"
        )
        XCTAssertTrue(
            view.activeConstraints.allSatisfy {
                $0.firstItem === barView && $0.secondItem === barView.superview
            }
        )
        XCTAssertTrue(
            view.activeConstraints.allSatisfy {
                switch $0.firstAttribute {
                case .top, .left:
                    return $0.constant == 20
                case .bottom, .right:
                    return $0.constant == -20
                default:
                    return false
                }
            }
        )
    }
    
    func testVerticalHorizontalEdges() {
        let barView = UIView()
        view.subviews(barView)
        
        barView
            .verticalEdges()
            .horizontalEdges()
        
        XCTAssertEqual(
            view.activeConstraints.count,
            4,
            "Should have 4 active constraints"
        )
        XCTAssertTrue(
            view.activeConstraints.allSatisfy {
                $0.firstItem === barView && $0.secondItem === barView.superview
            }
        )
        XCTAssertNotNil(
            view.activeConstraints.first { $0.firstAttribute == .left && $0.secondAttribute == .left }
        )
        XCTAssertNotNil(
            view.activeConstraints.first { $0.firstAttribute == .right && $0.secondAttribute == .right }
        )
        XCTAssertNotNil(
            view.activeConstraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top }
        )
        XCTAssertNotNil(
            view.activeConstraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom }
        )
    }
    
    func testDirectionalHorizontalEdges() {
        let barView = UIView()
        view.subviews(barView)
        
        barView
            .directionalHorizontalEdges()
        
        XCTAssertEqual(
            view.activeConstraints.count,
            2,
            "Should have 2 active constraints"
        )
        XCTAssertNotNil(
            view.activeConstraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading }
        )
        XCTAssertNotNil(
            view.activeConstraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing }
        )
    }
    
    func testRemoveConstraints() {
        let barView = UIView()
        
        view.subviews(barView)
        
        barView.edges()
        
        XCTAssertEqual(
            view.activeConstraints.count,
            4,
            "Should have 4 active constraints"
        )
        
        barView.removeConstraints()
        
        XCTAssertEqual(
            view.activeConstraints.count,
            0,
            "Should have 0 active constraints"
        )
        
        barView.size(50)
        
        XCTAssertEqual(
            view.activeConstraints.count,
            2,
            "Should have 2 active constraints"
        )
        
        barView.removeConstraints()
        
        XCTAssertEqual(
            view.activeConstraints.count,
            0,
            "Should have 0 active constraints"
        )
    }
    
    func testConstraintAttribute() {
        let barView = UIView()
        
        view.subviews(barView)
        
        barView.edges(30)
        
        XCTAssertEqual(
            view.activeConstraints.first(where: { $0.firstItem === barView && $0.firstAttribute == .left })?.constant,
            30
        )
        
        barView.constraint(attribute: .left)?.constant = 15
        
        XCTAssertEqual(
            view.activeConstraints.first(where: { $0.firstItem === barView && $0.firstAttribute == .left })?.constant,
            15
        )
        
        XCTAssertEqual(
            view.activeConstraints.count,
            4,
            "Should have 4 active constraints"
        )
        
        barView.constraint(attribute: .left)?.isActive = false
        
        XCTAssertEqual(
            view.activeConstraints.count,
            3,
            "Should have 3 active constraints"
        )
    }
    
    func testFlexibleMarginEdges() {
        let barView = UIView()
        
        view.subviews(barView)
        
        barView.edges(>=30)
        
        XCTAssertEqual(
            view.activeConstraints.count,
            4,
            "Should have 4 active constraints"
        )
        XCTAssertTrue(
            view.activeConstraints.allSatisfy {
                switch $0.firstAttribute {
                case .top, .left:
                    return $0.constant == 30 && $0.relation == .greaterThanOrEqual
                case .bottom, .right:
                    return $0.constant == -30 && $0.relation == .lessThanOrEqual
                default:
                    return false
                }
            }
        )
    }
}
