//
//  TestStyleSheet.swift
//  PluotTests
//
//  Created by Red Davis on 10/11/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import Foundation
@testable import Pluot


internal struct TestStyleSheet: StyleSheet
{
    static let `default` = Style()
        .font(.systemFont(ofSize: 24.0))
        .color(.red)
        .paragraph { (style) in
            style.alignment = .center
        }
    
    
    static let body = Style()
        .font(.systemFont(ofSize: 16.0))
        .color(.blue)
        .paragraph { (style) in
            style.alignment = .left
        }
}
