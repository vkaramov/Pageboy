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
        
        layoutContainers(for: contentOffset)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutContainers(for: contentOffset)
    }
}

extension PagingScrollView {
    
    private func layoutContainers(for contentOffset: CGPoint) {
        guard let pageContainers = pageContainers else {
            return
        }
        
        let pageSize = bounds.size
        contentSize = CGSize(width: pageSize.width * CGFloat(pageContainers.count),
                             height: pageSize.height)
        
        for (index, container) in pageContainers.enumerated() {
            let index = CGFloat(index)
            container.frame = CGRect(x: index * pageSize.width,
                                     y: 0.0,
                                     width: pageSize.width,
                                     height: pageSize.height)
        }
    }
}
