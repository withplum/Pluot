//
//  PluotTests.swift
//  PluotTests
//
//  Created by Red Davis on 10/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import XCTest
@testable import Pluot


internal final class PluotTests: XCTestCase
{
    // MARK: Setup
    
    override func setUp()
    {
        
    }

    // MARK: Tests
    
    /// Tests that Pluot uses the default style on string literals if not style has been set.
    func testUseOfDefaultStyle()
    {
        let pluot = Pluot(
            .color(.red),
            .font(.systemFont(ofSize: 24.0)),
            .paragraph({ (style) in
                style.alignment = .center
            })
        )
        
        let attributes = pluot.build(
            .string("test")
        ).attributes(at: 0, effectiveRange: nil)
        
        XCTAssertEqual(attributes[.foregroundColor] as? UIColor, UIColor.red)
        XCTAssertEqual(attributes[.font] as? UIFont, UIFont.systemFont(ofSize: 24.0))
        XCTAssertEqual((attributes[.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, .center)
    }
    
    /// Tests that Pluot uses the specified style.
    func testOridingStyles()
    {
        let pluot = Pluot(
            .color(.red),
            .font(.systemFont(ofSize: 24.0)),
            .paragraph({ (style) in
                style.alignment = .center
            })
        )
        
        let attributes = pluot.build(
            .string("test", [.color(.blue), .font(.systemFont(ofSize: 16.0))])
        ).attributes(at: 0, effectiveRange: nil)
        
        XCTAssertEqual(attributes[.foregroundColor] as? UIColor, UIColor.blue)
        XCTAssertEqual(attributes[.font] as? UIFont, UIFont.systemFont(ofSize: 16.0))
    }
}
