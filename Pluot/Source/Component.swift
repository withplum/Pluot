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
        
        // MARK: Attribute
        
        internal var attribute: (string: String, styles: Set<Style>?) {
            switch self
            {
            case .space:
                return (" ", nil)
            case .newline:
                return ("\n", nil)
            case .string(let string, let styles):
                return (string, styles)
            }
        }
    }
}
