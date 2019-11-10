//
//  Style.swift
//  Pluot
//
//  Created by Red Davis on 10/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


public final class Style
{
    // Intenal
    internal private(set) var attributes = [NSAttributedString.Key : Any]()
    
    // MARK: Initialization
    
    public init() { }
    
    // MARK: Attributes
    
    public func font(_ font: UIFont) -> Self
    {
        self.attributes[.font] = font
        return self
    }
    
    public func color(_ color: UIColor) -> Self
    {
        self.attributes[.foregroundColor ] = color
        return self
    }
    
    public func paragraph(_ configuration: (_ style: NSMutableParagraphStyle) -> Void) -> Self
    {
        let style = NSMutableParagraphStyle()
        configuration(style)
        self.attributes[.paragraphStyle] = style
        
        return self
    }
}
