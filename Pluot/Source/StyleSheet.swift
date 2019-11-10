//
//  StyleSheet.swift
//  Pluot
//
//  Created by Red Davis on 10/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import Foundation


public protocol StyleSheet
{
    static var `default`: Style { get }
}



//@dynamicMemberLookup
//public struct StyleSheet
//{
//    // Intenal
//    internal let styles: [Style]
//
//    internal var defaultStyle: Style? {
//        return self.styles.first
//    }
//
//    // MARK: Initialization
//
//    public init(@StyleSheetBuilder builder: () -> [Style])
//    {
//        self.styles = builder()
//    }
//
//    // MARK: Dynamic member lookup
//
//    public subscript(dynamicMember member: String) -> Style
//    {
//        let style = self.styles.first { (style) -> Bool in
//            return style.id == member
//        }
//
//        guard let unwrappedStyle = style else { fatalError("Style: \(member) missing") }
//        return unwrappedStyle
//    }
//}
//
//
//
//
//@_functionBuilder
//public struct StyleSheetBuilder
//{
//    static func buildBlock(_ styles: Style...) -> [Style] {
//        return styles
//    }
//}
