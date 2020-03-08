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
    func testOveridingStyles()
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
    
    func testIfStatements()
    {
        let pluot = Pluot(
            .font(.systemFont(ofSize: 24.0))
        )
        
        let notShownString = "can't see"
        let shownString = "can see"
        
        let string = pluot.build(
            .string("test"),
            .if(1 == 2, [
                .string(notShownString)
            ]),
            .if(1 == 1, [
                .string(shownString)
            ])
        ).string
        
        XCTAssert(string.contains(shownString))
        XCTAssertFalse(string.contains(notShownString))
    }
    
    func testIfElseStatements()
    {
        let pluot = Pluot(
            .font(.systemFont(ofSize: 24.0))
        )
        
        let expressionOneNotShown = UUID().uuidString
        let expressionOneShown = UUID().uuidString
        let expressionTwoNotShown = UUID().uuidString
        let expressionTwoShown = UUID().uuidString
        
        let string = pluot.build(
            .string("test"),
            .if(1 == 2, [
                .string(expressionOneNotShown)
            ], else: [
                .string(expressionOneShown)
            ]),
            .if(1 == 1, [
                .string(expressionTwoShown)
            ], else: [
                .string(expressionTwoNotShown)
            ])
        ).string
        
        XCTAssert(string.contains(expressionOneShown))
        XCTAssert(string.contains(expressionTwoShown))
        XCTAssertFalse(string.contains(expressionOneNotShown))
        XCTAssertFalse(string.contains(expressionTwoNotShown))
    }
    
    func testUnwrappingValue()
    {
        let pluot = Pluot(
            .font(.systemFont(ofSize: 24.0))
        )
        
        let optionalString: String? = "test"
        let optionalNilString: String? = nil
        let expressionOneNotShown = UUID().uuidString
        let expressionOneShown = UUID().uuidString
        
        let string = pluot.build(
            .unwrap(optionalNilString, { (value) -> [Pluot.Component] in
                return [.string(expressionOneNotShown)]
            }),
            .unwrap(optionalString, { (value) -> [Pluot.Component] in
                return [.string(expressionOneShown)]
            })
        ).string
        
        XCTAssert(string.contains(expressionOneShown))
        XCTAssertFalse(string.contains(expressionOneNotShown))
    }
}
