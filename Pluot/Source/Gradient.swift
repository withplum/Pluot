//
//  Gradient.swift
//  Pluot
//
//  Created by Red Davis on 06/02/2020.
//  Copyright © 2020 Plum Fintech Limited. All rights reserved.
//

import UIKit


public extension Pluot
{
    struct Gradient
    {
        // Public
        public let start: CGPoint
        public let end: CGPoint
        public let colors: [UIColor]
        
        // MARK: Initialization
        
        public init(start: CGPoint, end: CGPoint, colors: UIColor...)
        {
            self.start = start
            self.end = end
            self.colors = colors
        }
        
        // MARK: API
        
        public func patternColor(for string: String, with attributes: [NSAttributedString.Key : Any]) -> UIColor
        {
            let attributedString = NSAttributedString(string: string, attributes: attributes)
            var size = attributedString.size()//string.size(withAttributes: attributes)
            size = CGSize(width: Int(size.width), height: Int(size.height))
            
            let layer = CAGradientLayer()
            layer.frame = CGRect(origin: .zero, size: size)
            layer.colors = self.colors.map { $0.cgColor }
            layer.startPoint = self.start
            layer.endPoint = self.end
            
            let image = UIGraphicsImageRenderer(size: size).image { context in
                layer.render(in: context.cgContext)
            }
            
            return UIColor(patternImage: image)
        }
    }
}
