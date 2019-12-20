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
    private let defaultStyles: Set<Style>
    
    // MARK: Initialization
    
    /// Creates a `Pluot` instance.
    ///
    /// - Parameter styles: A list of styles that will be used as the default styles for the `Pluot` components.
    public init(_ styles: Style...)
    {
        self.defaultStyles = Set(styles)
    }
    
    /// Creates a `Pluot` instance.
    ///
    /// - Parameter styles: An array of styles that will be used as the default styles for the `Pluot` components.
    public init(_ styles: [Style])
    {
        self.defaultStyles = Set(styles)
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
            for attribute in component.attributes
            {
                let combinedStyles: Set<Style>
                if let unwrappedStyles = attribute.styles
                {
                    combinedStyles = unwrappedStyles.union(self.defaultStyles)
                }
                else
                {
                    combinedStyles = self.defaultStyles
                }
                
                let attributes = combinedStyles.reduce(into: [NSAttributedString.Key : Any]()) { (dictionary, style) in
                    dictionary[style.attribute.0] = style.attribute.1
                }
                
                attributedString.append(NSAttributedString(string: attribute.string, attributes: attributes))
            }
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
