//
//  Component.swift
//  Pluot
//
//  Created by Red Davis on 19/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import Foundation


public extension Pluot
{
    /// Represents a component used for constructing text.
    enum Component
    {
        /// A string component.
        /// The `.string` component can also take an optional set of styles. There styles
        /// will be used to overide the default styles set when initializing a `Pluot` instance.
        case string(String, Set<Style>? = nil)
        
        /// A space component.
        /// Synthatic sugar for `.string(" ")`.
        case space
        
        /// A newline component.
        /// Synthatic sugar for `.string("\n")`.
        case newline
        
        /// An if component for building logic into component structure.
        case `if`(@autoclosure () -> Bool, [Component], else: [Component]? = nil)
        
        // MARK: Attribute
        
        /// A tuple of `(string: String, styles: Set<Style>?)`
        typealias Attribute = (string: String, styles: Set<Style>?)
        
        /// An array of `Attribute` instances.
        internal var attributes: [Attribute] {
            switch self
            {
            case .space:
                return [(" ", nil)]
            case .newline:
                return [("\n", nil)]
            case .string(let string, let styles):
                return [(string, styles)]
            case .if(let condition, let components, let elseComponents):
                guard condition() else
                {
                    guard let elseComponents = elseComponents else { return [] }
                    
                    return elseComponents.reduce(into: [Attribute](), { (result, component) in
                        result.append(contentsOf: component.attributes)
                    })
                }
                
                return components.reduce(into: [Attribute](), { (result, component) in
                    result.append(contentsOf: component.attributes)
                })
            }
        }
    }
}
