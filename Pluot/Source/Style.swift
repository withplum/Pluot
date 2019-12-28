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
    /// Declares a style that is applied to a `Pluot.Component`
    enum Style
    {
        /// A font style (`NSAttributedString.Key.font`).
        case font(UIFont)
        
        /// Foreground color (`NSAttributedString.Key.foregroundColor`).
        case color(UIColor)
        
        /// Foreground color (`NSAttributedString.Key.foregroundColor`).
        case link(URL)
        
        /// Paragraph style (`NSAttributedString.Key.paragraphStyle`).
        case paragraph(_ configuration: (_ style: inout NSMutableParagraphStyle) -> Void)
        
        /// Background color (`NSAttributedString.Key.backgroundColor`).
        case backgroundColor(UIColor)
        
        /// Ligatures (`NSAttributedString.Key.ligature`).
        case ligature(Int)
        
        /// Kerning (`NSAttributedString.Key.kern`).
        case kerning(Double)
        
        /// Strikethrough style (`NSAttributedString.Key.strikethroughStyle`).
        case strikethroughStyle(NSUnderlineStyle)
        
        /// Strikethrough color (`NSAttributedString.Key.strikethroughColor`).
        case strikethroughColor(UIColor)
        
        /// Underline style (`NSAttributedString.Key.underlineStyle`).
        case underlineStyle(NSUnderlineStyle)
        
        /// Stroke color (`NSAttributedString.Key.strokeColor`).
        case strokeColor(UIColor)
        
        /// Stroke width (`NSAttributedString.Key.strokeWidth`).
        case strokeWidth(Double)
        
        /// Shadow (`NSAttributedString.Key.shadow`).
        case shadow(NSShadow)
        
        /// Text effect (`NSAttributedString.Key.textEffect`).
        case textEffect(NSAttributedString.TextEffectStyle)
        
        /// Attachment (`NSAttributedString.Key.attachment`).
        case attachment(NSTextAttachment)
        
        /// Baseline offset (`NSAttributedString.Key.baselineOffset`).
        case baselineOffset(Double)
        
        /// Underline color (`NSAttributedString.Key.underlineColor`).
        case underlineColor(UIColor)
        
        /// Obliqueness (`NSAttributedString.Key.obliqueness`).
        case obliqueness(Double)
        
        /// Expansion (`NSAttributedString.Key.expansion`).
        case expansion(Double)
        
        /// Vertical glyph form (`NSAttributedString.Key.verticalGlyphForm`).
        case verticalGlyphForm(VerticalGlyphForm)
        
        // MARK: Attributes
        
        /// A tuple containing the `NSAttributedString.Key` and its value.
        internal var attribute: (NSAttributedString.Key, Any) {
            switch self
            {
            case .font(let font):
                return (.font, font)
            case .color(let color):
                return (.foregroundColor, color)
            case .link(let url):
                return (.link, url)
            case .paragraph(let configuration):
                var style = NSMutableParagraphStyle()
                configuration(&style)
                
                return (.paragraphStyle, style)
            case .backgroundColor(let color):
                return (.backgroundColor, color)
            case .ligature(let value):
                return (.ligature, value)
            case .kerning(let value):
                return (.kern, value)
            case .strikethroughStyle(let style):
                return (.strikethroughStyle, style)
            case .strikethroughColor(let color):
                return (.strikethroughColor, color)
            case .underlineStyle(let style):
                return (.underlineStyle, style)
            case .strokeColor(let color):
                return (.strokeColor, color)
            case .strokeWidth(let width):
                return (.strokeWidth, width)
            case .shadow(let shadow):
                return (.shadow, shadow)
            case .textEffect(let style):
                return (.textEffect, style.rawValue)
            case .attachment(let attachment):
                return (.attachment, attachment)
            case .baselineOffset(let offset):
                return (.baselineOffset, offset)
            case .underlineColor(let color):
                return (.underlineColor, color)
            case .obliqueness(let value):
                return (.obliqueness, value)
            case .expansion(let value):
                return (.expansion, value)
            case .verticalGlyphForm(let form):
                return (.verticalGlyphForm, form.rawValue)
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
        case .backgroundColor:
            hashValue = 4
        case .ligature:
            hashValue = 5
        case .kerning:
            hashValue = 6
        case .strikethroughStyle:
            hashValue = 7
        case .strikethroughColor:
            hashValue = 8
        case .underlineStyle:
            hashValue = 9
        case .strokeColor:
            hashValue = 10
        case .strokeWidth:
            hashValue = 11
        case .shadow:
            hashValue = 12
        case .textEffect:
            hashValue = 13
        case .attachment:
            hashValue = 14
        case .baselineOffset:
            hashValue = 15
        case .underlineColor:
            hashValue = 16
        case .obliqueness:
            hashValue = 17
        case .expansion:
            hashValue = 18
        case .verticalGlyphForm:
            hashValue = 19
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
