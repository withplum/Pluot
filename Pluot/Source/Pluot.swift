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
    // Public
    public let styles: Set<Style>
    
    // MARK: Initialization
    
    /// Creates a `Pluot` instance.
    /// - Parameter styles: A list of styles that will be used as the default styles for the `Pluot` components.
    public init(_ styles: Style...)
    {
        self.styles = Set(styles)
    }
    
    /// Creates a `Pluot` instance.
    /// - Parameter styles: An array of styles that will be used as the default styles for the `Pluot` components.
    public init(_ styles: Set<Style>)
    {
        self.styles = styles
    }
    
    // MARK: API
    
    /// Builds an `NSAttributedString` object from the provided components.
    /// - Parameter components: An array of `Pluot.Component` instances.
    /// - Returns: A `NSAttributedString` instance.
    public func build(_ components: [Component]) -> NSAttributedString
    {
        components.reduce(into: NSMutableAttributedString()) { (attributedString, component) in
            guard let string = component.closure(self.styles) else { return }
            attributedString.append(string)
        }
    }
    
    /// Builds an `NSAttributedString` object from the provided components.
    /// - Parameter components: A variadic parameter of `Pluot.Component` instances.
    /// - Returns: A `NSAttributedString` instance.
    public func build(_ components: Component...) -> NSAttributedString
    {
        self.build(components)
    }
}
