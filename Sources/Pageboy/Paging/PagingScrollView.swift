//
//  PagingScrollView.swift
//  Pageboy iOS
//
//  Created by Merrick Sapsford on 04/03/2019.
//  Copyright © 2019 UI At Six. All rights reserved.
//

import UIKit

internal final class PagingScrollView: UIScrollView {
    
    // MARK: Defaults
    
    private struct Defaults {
        static let queueCount = 3
    }
    
    // MARK: Properties
    
    let queueCount: Int
    
    private var pageContainers: [PagingPageContainer]?
    
    // MARK: Init
    
    init(queueCount: Int = Defaults.queueCount) {
        self.queueCount = queueCount
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.queueCount = Defaults.queueCount
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        addPageContainers()
    }
    
    // MARK: Containers
    
    private func addPageContainers() {
        var containers = [PagingPageContainer]()
        
        for _ in 0 ..< queueCount {
            let container = PagingPageContainer()
            addSubview(container)
            containers.append(container)
        }
        self.pageContainers = containers
    }
}
