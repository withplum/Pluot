//
//  Style.swift
//  Pluot
//
//  Created by Red Davis on 19/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


public extension Pluot
{
    enum Style
    {
        case font(UIFont)
        case color(UIColor)
        case paragraph(_ configuration: (_ style: NSMutableParagraphStyle) -> Void)
        
        // MARK: Attributes
        
        internal var attribute: (NSAttributedString.Key, Any) {
            switch self
            {
            case .font(let font):
                return (.font, font)
            case .color(let color):
                return (.foregroundColor, color)
            case .paragraph(let configuration):
                let style = NSMutableParagraphStyle()
                configuration(style)
                
                return (.paragraphStyle, style)
            }
        }
    }
}

// MARK: Hashable

extension Pluot.Style: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        let hashValue: Int
        switch self
        {
        case .font:
            hashValue = 0
        case .color:
            hashValue = 1
        case .paragraph:
            hashValue = 2
        }
        
        hasher.combine(hashValue)
    }
}

// MARK: Equatable

extension Pluot.Style: Equatable
{
    public static func == (lhs: Pluot.Style, rhs: Pluot.Style) -> Bool
    {
        switch (lhs, rhs)
        {
        case (.font, .font):
            return true
        case (.color, .color):
            return true
        case (.paragraph, .paragraph):
            return true
        default:
            return false
        }
    }
}
