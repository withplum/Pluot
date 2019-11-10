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
    func testUseOfDefaultStyleOnStringLiteral()
    {
        let string: Pluot<TestStyleSheet> = "test"
        let attributes = string.attributedString.attributes(at: 0, effectiveRange: nil)
        
        XCTAssertEqual(attributes[.foregroundColor] as? UIColor, UIColor.red)
        XCTAssertEqual(attributes[.font] as? UIFont, UIFont.systemFont(ofSize: 24.0))
        XCTAssertEqual((attributes[.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, .center)
    }
    
    /// Tests that Pluot uses the default style on interpolated strings that have no
    /// style specified.
    func testUseOfDefaultStyleOnInterpolatedStringsWithNoSpecifiedStyle()
    {
        let string: Pluot<TestStyleSheet> = "\("test")"
        let attributes = string.attributedString.attributes(at: 0, effectiveRange: nil)
        
        XCTAssertEqual(attributes[.foregroundColor] as? UIColor, UIColor.red)
        XCTAssertEqual(attributes[.font] as? UIFont, UIFont.systemFont(ofSize: 24.0))
        XCTAssertEqual((attributes[.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, .center)
    }
    
    /// Tests that Pluot uses the specified style.
    func testUseOfSpecifiedStyle()
    {
        let string: Pluot<TestStyleSheet> = "\("test", TestStyleSheet.body)"
        let attributes = string.attributedString.attributes(at: 0, effectiveRange: nil)
        
        XCTAssertEqual(attributes[.foregroundColor] as? UIColor, UIColor.blue)
        XCTAssertEqual(attributes[.font] as? UIFont, UIFont.systemFont(ofSize: 16.0))
        XCTAssertEqual((attributes[.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, .left)
    }
}
