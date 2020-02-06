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
        
        /// Link (`NSAttributedString.Key.link`).
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
        
        /// Gradient
        case gradient(Gradient)
        
        // MARK: Attributes
        
        /// Builds a tuple containing the `NSAttributedString.Key` and its value.
        /// - Parameter string: The string that this attribute will be applied to
        internal func attribute(for string: String, styles: [Style]) -> (NSAttributedString.Key, Any)
        {
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
            case .gradient(let gradient):
                let attributes = styles.reduce(into: [NSAttributedString.Key : Any]()) { (dictionary, style) in
                    if case .gradient = style
                    {
                        return
                    }
                    
                    let styleAttribute = style.attribute(for: string, styles: styles)
                    dictionary[styleAttribute.0] = styleAttribute.1
                }
                
                return (.foregroundColor, gradient.patternColor(for: string, with: attributes))
            }
        }
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
        case (.link, .link):
            return true
        case (.backgroundColor, .backgroundColor):
            return true
        case (.ligature, .ligature):
            return true
        case (.kerning, .kerning):
            return true
        case (.strikethroughStyle, .strikethroughStyle):
            return true
        case (.strokeColor, .strikethroughColor):
            return true
        case (.underlineStyle, .underlineStyle):
            return true
        case (.strokeColor, .strokeColor):
            return true
        case (.strokeWidth, .strokeWidth):
            return true
        case (.shadow, .shadow):
            return true
        case (.textEffect, .textEffect):
            return true
        case (.attachment, .attachment):
            return true
        case (.baselineOffset, .baselineOffset):
            return true
        case (.underlineColor, .underlineColor):
            return true
        case (.obliqueness, .obliqueness):
            return true
        case (.expansion, .expansion):
            return true
        case (.verticalGlyphForm, .verticalGlyphForm):
            return true
        case (.gradient, .gradient):
            return true
        default:
            return false
        }
    }
}
