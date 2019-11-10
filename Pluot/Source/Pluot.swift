//
//  Pluot.swift
//  Pluot
//
//  Created by Red Davis on 10/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


public struct Pluot<T: StyleSheet>
{
    // Public
    public let attributedString: NSAttributedString
}

// MARK: ExpressibleByStringLiteral

extension Pluot: ExpressibleByStringLiteral
{
    public init(stringLiteral: String)
    {
        self.attributedString = NSAttributedString(string: stringLiteral, attributes: T.default.attributes)
    }
}

// MARK: CustomStringConvertible

extension Pluot: CustomStringConvertible
{
    public var description: String {
        String(describing: self.attributedString)
    }
}

// MARK: ExpressibleByStringInterpolation

extension Pluot: ExpressibleByStringInterpolation
{
    public init(stringInterpolation: Pluot.StringInterpolation<T>)
    {
        self.attributedString = stringInterpolation.attributedString
    }
}



// MARK: StringInterpolation

public extension Pluot
{
    struct StringInterpolation<T: StyleSheet>: StringInterpolationProtocol
    {
        // Fileprivate
        fileprivate var attributedString = NSMutableAttributedString()
        
        // MARK: Initialization
        
        public init(literalCapacity: Int, interpolationCount: Int) { }
        
        // MARK: API
        
        public mutating func appendLiteral(_ literal: String)
        {
            let string = NSAttributedString(string: literal, attributes: T.default.attributes)
            self.attributedString.append(string)
        }
        
        public func appendInterpolation(_ string: String, _ style: Style)
        {
            let string = NSAttributedString(string: string, attributes: style.attributes)
            self.attributedString.append(string)
        }
        
        public func appendInterpolation(_ string: String)
        {
            let string = NSAttributedString(string: string, attributes: T.default.attributes)
            self.attributedString.append(string)
        }
    }
}
