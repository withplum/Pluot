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
        case link(URL)
        case paragraph(_ configuration: (_ style: inout NSMutableParagraphStyle) -> Void)
        
        // MARK: Attributes
        
        internal var attribute: (NSAttributedString.Key, Any) {
            switch self
            {
            case .font(let font):
                return (.font, font)
            case .color(let color):
                return (.foregroundColor, color)
            case .link(let url):
                return (.link, url.absoluteString)
            case .paragraph(let configuration):
                var style = NSMutableParagraphStyle()
                configuration(&style)
                
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
        case .link:
            hashValue = 3
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
