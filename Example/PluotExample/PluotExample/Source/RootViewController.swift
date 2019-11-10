//
//  RootViewController.swift
//  PluotExample
//
//  Created by Red Davis on 06/10/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import Pluot
import UIKit


internal final class RootViewController: UIViewController
{
    // Private
    private let label: UILabel = {
        let uuid = UUID().uuidString
        let string: Pluot<MainStyleSheet> = """
Hello. This is a test
\(uuid, MainStyleSheet.bold)
"""
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = string.attributedString
        return view
    }()
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Label
        self.view.addSubview(self.label)
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        self.label.frame = self.view.bounds
    }
}



// MARK: Main style sheet

internal struct MainStyleSheet: StyleSheet
{
    static let `default` = Style()
        .font(.systemFont(ofSize: 24.0))
        .color(.red)
        .paragraph { (style) in
            style.alignment = .left
        }
    
    
    static let bold = Style()
        .font(.systemFont(ofSize: 24.0, weight: .bold))
        .color(.blue)
        .paragraph { (style) in
            style.alignment = .left
        }
}
