//
//  Pluot.swift
//  Pluot
//
//  Created by Red Davis on 10/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


public struct Pluot
{
    // Private
    private let defaultStyles: [Style]
    
    // MARK: Initialization
    
    /// Creates a `Pluot` instance.
    ///
    /// - Parameter styles: A list of styles that will be used as the default styles for the `Pluot` components.
    public init(_ styles: Style...)
    {
        self.defaultStyles = styles
    }
    
    /// Creates a `Pluot` instance.
    ///
    /// - Parameter styles: An array of styles that will be used as the default styles for the `Pluot` components.
    public init(_ styles: [Style])
    {
        self.defaultStyles = styles
    }
    
    // MARK: API
    
    /// Builds an `NSAttributedString` object from the provided components.
    ///
    /// - Parameter components: An array of `Pluot.Component` instances.
    ///
    /// - Returns: A `NSAttributedString` instance.
    public func build(_ components: [Component]) -> NSAttributedString
    {
        components.reduce(into: NSMutableAttributedString()) { (attributedString, component) in
            attributedString.append(component.attributedString(with: self.defaultStyles))
        }
    }
    
    /// Builds an `NSAttributedString` object from the provided components.
    ///
    /// - Parameter components: A variadic parameter of `Pluot.Component` instances.
    ///
    /// - Returns: A `NSAttributedString` instance.
    public func build(_ components: Component...) -> NSAttributedString
    {
        self.build(components)
    }
}
