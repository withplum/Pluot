//
//  Pluot.swift
//  Pluot
//
//  Created by Red Davis on 10/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


public final class Pluot
{
    // Private
    private let defaultStyles: Set<Style>
    
    // MARK: Initialization

    public init(_ styles: Style...)
    {
        self.defaultStyles = Set(styles)
    }
    
    // MARK: API
    
    public func build(_ components: Component...) -> NSAttributedString
    {
        components.reduce(into: NSMutableAttributedString()) { (attributedString, component) in
            let componentAttribute = component.attribute
            let combinedStyles: Set<Style>
            if let unwrappedStyles = componentAttribute.styles
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
            
            attributedString.append(NSAttributedString(string: componentAttribute.string, attributes: attributes))
        }
    }
}
