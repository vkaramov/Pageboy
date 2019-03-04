//
//  PagingPageContainer.swift
//  Pageboy iOS
//
//  Created by Merrick Sapsford on 04/03/2019.
//  Copyright © 2019 UI At Six. All rights reserved.
//

import UIKit

class PagingPageContainer: UIView {
    
    // MARK: Properties
    
    private let debugLabel = UILabel()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        
        addSubview(debugLabel)
        debugLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            debugLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            debugLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 5.0
        debugLabel.textColor = .red
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let index = superview?.subviews.index(where: { $0 === self }) {
            debugLabel.text = "Container: \(index)"
        }
    }
}
