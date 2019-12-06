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
    enum Component
    {
        case string(String, Set<Style>? = nil)
        case space
        case newline
        case `if`(@autoclosure () -> Bool, [Component], else: [Component]? = nil)
        
        typealias Attribute = (string: String, styles: Set<Style>?)
        
        // MARK: Attribute
        
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
