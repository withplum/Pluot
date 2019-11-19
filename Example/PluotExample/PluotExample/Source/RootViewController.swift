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

        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = Pluot(
            .font(.systemFont(ofSize: 24.0)),
            .color(.red),
            .paragraph({ (style) in
                style.alignment = .center
            })
        ).build(
            .string("Hello. This is a test"),
            .space,
            .string(uuid, [.font(.systemFont(ofSize: 24.0, weight: .bold)), .color(.blue)])
        )
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
