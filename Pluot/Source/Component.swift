//
//  Component.swift
//  Pluot
//
//  Created by Red Davis on 19/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


public extension Pluot
{
    struct Component
    {
        // Public
        public typealias Closure = (_ defaultStyles: Set<Style>) -> NSAttributedString?
        
        // Internal
        internal let closure: Closure
        
        // MARK: Initialization
        
        /// Creates a `Component` instance.
        /// - Parameter closure: A closure to construct the component.
        public init(_ closure: @escaping Closure)
        {
            self.closure = closure
        }
    }
}

// MARK: String

public extension Pluot.Component
{
    /// A string component.
    /// The component can also take an optional set of styles. The styles
    /// will be used to overide the default styles set when initializing a `Pluot` instance.
    /// - Parameters:
    ///   - string: A string instance.
    ///   - styles: An array of styles.
    /// - Returns: A `Component` instance.
    static func string(_ string: String, _ styles: Set<Pluot.Style>? = nil) -> Pluot.Component
    {
        return Pluot.Component { (defaultStyles) -> NSAttributedString? in
            let combinedStyles: Set<Pluot.Style>
            if let styles = styles
            {
                combinedStyles = styles.union(defaultStyles)
            }
            else
            {
                combinedStyles = defaultStyles
            }
                
            let attributes = combinedStyles.reduce(into: [NSAttributedString.Key : Any]()) { (dictionary, style) in
                style.closure(&dictionary)
            }
            
            return NSAttributedString(string: string, attributes: attributes)
        }
    }
}

// MARK: Space

public extension Pluot.Component
{
    /// A space component.
    /// Synthatic sugar for `.string(" ")`.
    /// - Returns: A `Pluot.Component` instance.
    static func space() -> Pluot.Component
    {
        return .string(" ")
    }
}

// MARK: Newline

public extension Pluot.Component
{
    /// A newline component.
    /// Synthatic sugar for `.string(" ")`.
    /// - Returns: A `Pluot.Component` instance.
    static func newline() -> Pluot.Component
    {
        return .string("\n")
    }
}

// MARK: Image

public extension Pluot.Component
{
    /// An image component.
    /// Embed an image into the `NSAttributedString`.
    /// - Parameters:
    ///   - image: An image instance.
    /// - Returns: A `Pluot.Component` instance.
    static func image(_ image: UIImage) -> Pluot.Component
    {
        return Pluot.Component { (defaultStyles) -> NSAttributedString? in
            let attachment = NSTextAttachment()
            attachment.image = image
            
            return NSAttributedString(attachment: attachment)
        }
    }
}

// MARK: If

public extension Pluot.Component
{
    /// An if component.
    /// Used for building flow of logic.
    /// - Parameters:
    ///   - condition: A condition that determines whether `components` are constructed.
    ///   - components: An array of components.
    static func `if`(_ condition: @escaping @autoclosure () -> Bool, _ components: @escaping @autoclosure () -> [Pluot.Component]) -> Pluot.Component
    {
        return Pluot.Component { (defaultStyles) -> NSAttributedString? in
            guard condition() else { return nil }
            
            return components().reduce(into: NSMutableAttributedString()) { (string, component) in
                guard let componentString = component.closure(defaultStyles) else { return }
                string.append(componentString)
            }
        }
    }
}

// MARK: If else

public extension Pluot.Component
{
    /// An if else component.
    /// Used for building flow of logic.
    /// If the condition is met, then the `ifComponents` are constructed, otherwise
    /// the `elseComponents` are.
    /// - Parameters:
    ///   - condition: A condition that determines whether `ifComponents` are constructed.
    ///   - ifComponents: An array of components.
    ///   - elseComponents: An array of components.
    static func `if`(_ condition: @escaping @autoclosure () -> Bool, _ ifComponents: @escaping @autoclosure () -> [Pluot.Component], else elseComponents: @escaping @autoclosure () -> [Pluot.Component]) -> Pluot.Component
    {
        return Pluot.Component { (defaultStyles) -> NSAttributedString? in
            let components: [Pluot.Component]
            if condition()
            {
                components = ifComponents()
            }
            else
            {
                components = elseComponents()
            }
            
            return components.reduce(into: NSMutableAttributedString()) { (string, component) in
                guard let componentString = component.closure(defaultStyles) else { return }
                string.append(componentString)
            }
        }
    }
}

// MARK: Unwrap

public extension Pluot.Component
{
    /// An unwrap component.
    /// If an optional value is not nil then the components are constructed.
    /// - Parameters:
    ///   - condition: A condition that determines whether `components` are constructed.
    ///   - components: An array of components.
    static func unwrap<T>(_ value: T?, _ components: @escaping (_ value: T) -> [Pluot.Component]) -> Pluot.Component
    {
        return Pluot.Component { (defaultStyles) -> NSAttributedString? in
            guard let value = value else { return nil }
            
            return components(value).reduce(into: NSMutableAttributedString()) { (string, component) in
                guard let componentString = component.closure(defaultStyles) else { return }
                string.append(componentString)
            }
        }
    }
}
