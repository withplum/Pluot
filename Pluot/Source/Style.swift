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
    struct Style
    {
        // Public
        public typealias Closure = (_ attributes: inout [NSAttributedString.Key : Any]) -> Void
        
        // Internal
        internal let closure: Closure
        
        // Private
        private let id: String
        
        // MARK: Initialization
        
        public init(id: String, closure: @escaping Closure)
        {
            self.id = id
            self.closure = closure
        }
    }
}

// MARK: Equatable

extension Pluot.Style: Equatable
{
    static public func ==(lhs: Pluot.Style, rhs: Pluot.Style) -> Bool
    {
        return lhs.id == rhs.id
    }
}

// MARK: Hashable

extension Pluot.Style: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        self.id.hash(into: &hasher)
    }
}



// MARK: Font

public extension Pluot.Style
{
    /// A font style (`NSAttributedString.Key.font`).
    /// - Parameter font: The font.
    static func font(_ font: UIFont) -> Pluot.Style
    {
        return Pluot.Style(id: "font") { (attributes) in
            attributes[.font] = font
        }
    }
}

// MARK: Color

public extension Pluot.Style
{
    /// Foreground color (`NSAttributedString.Key.foregroundColor`).
    /// - Parameter color: The foreground color.
    static func color(_ color: UIColor) -> Pluot.Style
    {
        return Pluot.Style(id: "color") { (attributes) in
            attributes[.foregroundColor] = color
        }
    }
}

// MARK: Link

public extension Pluot.Style
{
    /// Link (`NSAttributedString.Key.link`).
    /// - Parameter url: The url.
    static func link(_ url: URL) -> Pluot.Style
    {
        return Pluot.Style(id: "link") { (attributes) in
            attributes[.link] = url
        }
    }
}

// MARK: Paragraph

public extension Pluot.Style
{
    /// Paragraph style (`NSAttributedString.Key.paragraphStyle`).
    /// - Parameter configuration: The paragraph style.
    static func paragraph(_ configuration: @escaping (_ style: inout NSMutableParagraphStyle) -> Void) -> Pluot.Style
    {
        return Pluot.Style(id: "paragraph") { (attributes) in
            var style = NSMutableParagraphStyle()
            configuration(&style)
            attributes[.paragraphStyle] = style
        }
    }
}

// MARK: Background color

public extension Pluot.Style
{
    /// Background color (`NSAttributedString.Key.backgroundColor`).
    /// - Parameter color: The background color.
    static func backgroundColor(_ color: UIColor) -> Pluot.Style
    {
        return Pluot.Style(id: "backgroundColor") { (attributes) in
            attributes[.backgroundColor] = color
        }
    }
}

// MARK: Ligature

public extension Pluot.Style
{
    /// Ligatures (`NSAttributedString.Key.ligature`).
    /// - Parameter value: The ligature value/
    static func ligature(_ value: Int) -> Pluot.Style
    {
        return Pluot.Style(id: "ligature") { (attributes) in
            attributes[.ligature] = value
        }
    }
}

// MARK: Kerning

public extension Pluot.Style
{
    /// Kerning (`NSAttributedString.Key.kern`).
    /// - Parameter value: The kerning value.
    static func kerning(_ value: Double) -> Pluot.Style
    {
        return Pluot.Style(id: "kerning") { (attributes) in
            attributes[.kern] = value
        }
    }
}

// MARK: Strikethrough style

public extension Pluot.Style
{
    /// Strikethrough style (`NSAttributedString.Key.strikethroughStyle`).
    /// - Parameter style: The strike through style.
    static func strikethroughStyle(_ style: NSUnderlineStyle) -> Pluot.Style
    {
        return Pluot.Style(id: "strikethroughStyle") { (attributes) in
            attributes[.strikethroughStyle] = style
        }
    }
}

// MARK: Strikethrough color

public extension Pluot.Style
{
    /// Strikethrough color (`NSAttributedString.Key.strikethroughColor`).
    /// - Parameter color: The strikethrough color.
    static func strikethroughColor(_ color: UIColor) -> Pluot.Style
    {
        return Pluot.Style(id: "strikethroughColor") { (attributes) in
            attributes[.strikethroughColor] = color
        }
    }
}

// MARK: Underline style

public extension Pluot.Style
{
    /// Underline style (`NSAttributedString.Key.underlineStyle`).
    /// - Parameter style: The underline style.
    static func underlineStyle(_ style: NSUnderlineStyle) -> Pluot.Style
    {
        return Pluot.Style(id: "underlineStyle") { (attributes) in
            attributes[.underlineStyle] = style
        }
    }
}

// MARK: Stroke color

public extension Pluot.Style
{
    /// Stroke color (`NSAttributedString.Key.strokeColor`).
    /// - Parameter color: The stroke color.
    static func strokeColor(_ color: UIColor) -> Pluot.Style
    {
        return Pluot.Style(id: "strokeColor") { (attributes) in
            attributes[.strokeColor] = color
        }
    }
}

// MARK: Stroke width

public extension Pluot.Style
{
    /// Stroke width (`NSAttributedString.Key.strokeWidth`).
    /// - Parameter width: The stroke width.
    static func strokeWidth(_ width: Double) -> Pluot.Style
    {
        return Pluot.Style(id: "strokeWidth") { (attributes) in
            attributes[.strokeWidth] = width
        }
    }
}

// MARK: Shadow

public extension Pluot.Style
{
    /// Shadow (`NSAttributedString.Key.shadow`).
    /// - Parameter shadow: The `NSShadow` instance.
    static func shadow(_ shadow: NSShadow) -> Pluot.Style
    {
        return Pluot.Style(id: "shadow") { (attributes) in
            attributes[.shadow] = shadow
        }
    }
}

// MARK: Text effect

public extension Pluot.Style
{
    /// Text effect (`NSAttributedString.Key.textEffect`).
    /// - Parameter style: The `NSAttributedString.TextEffectStyle` instance.
    static func textEffect(_ style: NSAttributedString.TextEffectStyle) -> Pluot.Style
    {
        return Pluot.Style(id: "textEffect") { (attributes) in
            attributes[.textEffect] = style.rawValue
        }
    }
}

// MARK: Baseline offset

public extension Pluot.Style
{
    /// Baseline offset (`NSAttributedString.Key.baselineOffset`).
    /// - Parameter offset: BThe bseline offset value.
    static func baselineOffset(_ offset: Double) -> Pluot.Style
    {
        return Pluot.Style(id: "baselineOffset") { (attributes) in
            attributes[.baselineOffset] = offset
        }
    }
}

// MARK: Underline color

public extension Pluot.Style
{
    /// Underline color (`NSAttributedString.Key.underlineColor`).
    /// - Parameter color: The underline color.
    static func underlineColor(_ color: UIColor) -> Pluot.Style
    {
        return Pluot.Style(id: "underlineColor") { (attributes) in
            attributes[.underlineColor] = color
        }
    }
}

// MARK: Obliqueness

public extension Pluot.Style
{
    /// Obliqueness (`NSAttributedString.Key.obliqueness`).
    /// - Parameter value: Obliqueness value.
    static func obliqueness(_ value: Double) -> Pluot.Style
    {
        return Pluot.Style(id: "obliqueness") { (attributes) in
            attributes[.obliqueness] = value
        }
    }
}

// MARK: Expansion

public extension Pluot.Style
{
    /// Expansion (`NSAttributedString.Key.expansion`).
    /// - Parameter value: Expansion value.
    static func expansion(_ value: Double) -> Pluot.Style
    {
        return Pluot.Style(id: "expansion") { (attributes) in
            attributes[.expansion] = value
        }
    }
}

// MARK: Vertical glyph form

public extension Pluot.Style
{
    /// Vertical glyph form (`NSAttributedString.Key.verticalGlyphForm`).
    /// - Parameter value: Glyph form.
    static func verticalGlyphForm(_ value: VerticalGlyphForm) -> Pluot.Style
    {
        return Pluot.Style(id: "verticalGlyphForm") { (attributes) in
            attributes[.verticalGlyphForm] = value.rawValue
        }
    }
}

// MARK: Bold

public extension Pluot.Style
{
    /// Adds a bold trait to the specified font/
    static func bold() -> Pluot.Style
    {
        return Pluot.Style(id: "bold") { (attributes) in
            guard let font = attributes[.font] as? UIFont,
                  let descriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) else { return }
            
            attributes[.font] = UIFont(descriptor: descriptor, size: font.pointSize)
        }
    }
}

// MARK: Italic

public extension Pluot.Style
{
    /// Adds a italic trait to the specified font/
    static func italic() -> Pluot.Style
    {
        return Pluot.Style(id: "italic") { (attributes) in
            guard let font = attributes[.font] as? UIFont,
                  let descriptor = font.fontDescriptor.withSymbolicTraits(.traitItalic) else { return }
            
            attributes[.font] = UIFont(descriptor: descriptor, size: font.pointSize)
        }
    }
}
